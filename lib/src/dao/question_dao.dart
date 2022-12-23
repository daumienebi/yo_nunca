import 'package:sqflite/sqflite.dart';
import 'package:yo_nunca/src/database/database_provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'dart:developer' as dev;

class QuestionDao {
  final String questionTable = 'question';
  final databaseProvider = DatabaseProvider.instance;

  /// Add a new [question]
  addQuestion(Question question) async {
    final database = await databaseProvider.database;
    int row = 0;
    try {
      row = await database.insert(questionTable, question.toMap());
    } on DatabaseException catch (ex) {
      dev.log(ex.toString());
    }
    return row;
  }

  /// Add a various [questions] to the database with the [Batch] insert method
  addQuestions(List<Question> questions) async {
    final database = await databaseProvider.database;
    Batch batch = database.batch();
    List<Object?> operations = [];
    int count = 0;
    try {
      for(var question in questions){
        batch.insert(questionTable, question.toMap());
      }
      operations = await batch.commit();
    } on DatabaseException catch (ex) {
      dev.log(ex.toString());
    }
    if(operations.isNotEmpty){
      count = operations.length;
    }
    return count;
  }

  /// Delete a [question]
  deleteQuestion(Question question) async{
    final database = await databaseProvider.database;
    final id = await database.delete(questionTable,where: '${QuestionFields.id} = ?',
      whereArgs: ['${question.id}']);
    return id;
  }

  /// Modify a [question]
  modifyQuestion(Question question) async{
    final database = await databaseProvider.database;
    final id = await database.update(questionTable,question.toMap(),
        where: '${QuestionFields.id} = ?',whereArgs: [question.id]);
    return id;
  }

  /// Return all the available questions, for MIXED MODE
  getAllQuestions() async{
    final database = await databaseProvider.database;
    final result = await database.query(questionTable);
    return result.map((e) => Question.fromMap(e)).toList();
  }

  /// Fetch the favourite questions
  getFavouriteQuestions() async{
    final database = await databaseProvider.database;
    final result = await database.query(questionTable,where:'${QuestionFields.isFavourite} = 1');
    return result.map((e) => Question.fromMap(e)).toList();//Favourite questions
  }

  /// Get the questions for each [Category]
  getQuestionsPerCategory(int categoryId) async{
    final database = await databaseProvider.database;
    final result = await database.query(questionTable,where: '${QuestionFields.categoryId} = ?',
      whereArgs: [categoryId]);
    return result.map((e) => Question.fromMap(e)).toList();
  }

  /// Return the number of questions a category has
  countQuestionsPerCategory(int categoryId) async{
    int count = 0;
    final database = await databaseProvider.database;
    count = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) from $questionTable'
    ' where categoryId = $categoryId'))!;
    return count;
  }

  /// Set a [question] as favourite
  addToFavourites(Question question) async{
    final database = await databaseProvider.database;
    int rows = 0;
    try {
      rows = await database.update(questionTable,question.toMap(),
          where: '${QuestionFields.id} = ?',whereArgs: [question.id]);
    } on DatabaseException catch (ex) {
      dev.log(ex.toString());
    }
    return rows;
  }

  /// Set a [question] as non-favourite
  removeFromFavourites(Question question) async{
    final database = await databaseProvider.database;
    final rows = await database.update(questionTable,question.toMap(),
        where: '${QuestionFields.id} = ?',whereArgs: [question.id]);
    return rows;
  }

}
