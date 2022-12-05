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
    int dbCount = 0;
    dbCount ++;
    //dev.log("entering to get all categories");
    //dev.log('Entered $dbCount times');
    final database = await databaseProvider.database;
    String orderBy = '${CategoryFields.description} ASC';
    //database.query('SELECT * FROM $categoryTable ORDER BY $orderBy');
    final result = await database.query(categoryTable,orderBy: orderBy);
    return result.map((data) => Category.fromMap(data)).toList();
  }

  getDefaultCategories() async{
    final database = await databaseProvider.database;
    final result = await database.query(categoryTable,where: '${CategoryFields.id} IN (?,?,?)',
        whereArgs: [1,2,3]);
    return result.map((e) => Category.fromMap(e)).toList();
  }

  getNewCategories() async{
    final database = await databaseProvider.database;
    final result = await database.query(categoryTable,where: '${CategoryFields.id} NOT IN (?,?,?)',
        whereArgs: [1,2,3]);
    return result.map((e) => Category.fromMap(e)).toList();
  }

  ///Modify an existing [category]
  modifyCategory(Category category) async{
    final database = await databaseProvider.database;
    final id = await database.update(categoryTable,category.toMap(),where: '${CategoryFields.id} = ?',
        whereArgs: [category.id]);
    return true; //true if the category has been modified successfully
  }
}