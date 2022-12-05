import 'package:sqflite/sqflite.dart';
import 'package:yo_nunca/src/database/database_provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'dart:developer' as dev;

class QuestionDao {
  final String questionTable = 'question';
  final databaseProvider = DatabaseProvider.instance;

  //Add a new [question]
  addQuestion(Question question) async {
    final database = await databaseProvider.database;
    int id = 0;
    try {
      id = await database.insert(questionTable, question.toMap());
    } on DatabaseException catch (ex) {
      dev.log(ex.toString());
    }
    return id;
  }

  //Delete a [question]
  deleteQuestion(Question question) async{
    final database = await databaseProvider.database;
    final id = await database.delete(questionTable,where: '${QuestionFields.id} = ?',
      whereArgs: ['${question.id}']);
    return id;
  }

  //Modify a [question]
  modifyQuestion(Question question) async{
    final database = await databaseProvider.database;
    final id = await database.update(questionTable,question.toMap(),
        where: '${QuestionFields.id} = ?',whereArgs: [{question.id}]);
    return id;
  }

  //Return all the available questions, for MIXED MODE
  getAllQuestions() async{
    final database = await databaseProvider.database;
    String orderBy = '';
    final result = await database.query(questionTable);
    return result.map((e) => Question.fromMap(e)).toList();
  }

  //Fetch the favourite questions
  getFavouriteQuestions() async{
    final database = await databaseProvider.database;
    final result = await database.query(questionTable,where:'${QuestionFields.isFavourite} = 1');
    return result.map((e) => Question.fromMap(e)).toList();//Favourite questions
  }

  getQuestionsPerCategory(int categoryId) async{
    final database = await databaseProvider.database;
    final result = await database.query(questionTable,where: '${QuestionFields.categoryId} = ?',
      whereArgs: [categoryId]);
    return result.map((e) => Question.fromMap(e)).toList();
  }

  countQuestionsPerCategory(int categoryId) async{
    dev.log("Entering to count");
    int count = 0;
    final database = await databaseProvider.database;
    var result = await database.rawQuery('SELECT COUNT(*) from $questionTable'
        ' where categoryId = $categoryId');
    return count;
  }

  addToFavourites(Question question) async{
    dev.log("Adding question to favourites");
    final database = await databaseProvider.database;
    int id = 0;
    try {
      id = await database.update(questionTable,question.toMap(),
          where: '${QuestionFields.id} = ?',whereArgs: [question.id]);
    } on DatabaseException catch (ex) {
      dev.log(ex.toString());
    }
    return id;
  }

  removeFromFavourites(Question question) async{
    dev.log("Removing from favourites");
    final database = await databaseProvider.database;
    final id = await database.update(questionTable,question.toMap(),
        where: '${QuestionFields.id} = ?',whereArgs: [question.id]);
    return id;
  }

}
