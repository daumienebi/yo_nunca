import 'package:sqflite/sqflite.dart';
import 'package:yo_nunca/src/database/database_provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'dart:developer' as dev;
class CategoryDao{
  final String categoryTable = 'category';
  final databaseProvider = DatabaseProvider.instance;

  ///Add a new [category]
  addCategory(Category category) async{
    final database = await databaseProvider.database;
    int id = 0;
    try{
      id = await database.insert(categoryTable,category.toMap());
      //conflictAlgorithm: ConflictAlgorithm.replace,
    }on DatabaseException catch(ex){
      //compare to check if the name of the category already exists ; it has
      //to be unique
      dev.log(ex.toString());
    }
    return id; // return the inserted id

  }

  ///Deletes a [category] that already exists
  deleteCategory(Category category) async{
    final database = await databaseProvider.database;
    final id = await database.delete(categoryTable,where: '${CategoryFields.id} = ?',whereArgs: [category.id]);
    return id; //return the deleted id
  }

  ///Find a category by its [id]
  getCategory(int id) async{
    final database = await databaseProvider.database;
    final category  = await database.query(categoryTable,columns: CategoryFields.values,
        where: '${CategoryFields.id} = ?', whereArgs: [id]);

    if(category.isNotEmpty){
      return Category.fromMap(category.first);
    }else{
      throw Exception('$id not found');
    }
  }

  ///Return all the available categories
  getAllCategories() async{
    final database = await databaseProvider.database;
    String orderBy = '${CategoryFields.description} ASC';
    final result = await database.query(categoryTable,orderBy: orderBy);
    return result.map((data) => Category.fromMap(data)).toList();
  }

  getDefaultCategories() async{
    final database = await databaseProvider.database;
    final result = await database.query(categoryTable,where: '${CategoryFields.id} IN (?,?,?)',
        whereArgs: [1,2,3]);
    return result.map((e) => Category.fromMap(e)).toList();
  }

  ///Returns the categories added by the user, the first 3 were inserted on
  ///creating the DB
  getNewCategories() async{
    final database = await databaseProvider.database;
    final result = await database.query(categoryTable,where: '${CategoryFields.id} NOT IN (?,?,?)',
        whereArgs: [1,2,3]);
    return result.map((e) => Category.fromMap(e)).toList();
  }

  /// Checks if a category with the given [categoryName] exists
  categoryExists(String categoryName) async{
    final database = await databaseProvider.database;
    int count = 0;
    count = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) from $categoryTable'
        ' where ${CategoryFields.description} = \"$categoryName\"'))!;
    dev.log("$count categories with that name");
    return count > 0 ? true : false;
  }

  ///Modify an existing [category]
  modifyCategory(Category category) async{
    final database = await databaseProvider.database;
    final count = await database.update(categoryTable,category.toMap(),where: '${CategoryFields.id} = ?',
        whereArgs: [category.id]);
    return count;
  }
}