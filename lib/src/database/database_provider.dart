import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'dart:developer' as dev;

import 'package:yo_nunca/src/utils/default_data.dart';

///Create the singleton pattern to ensure that the class only has one instance
class DatabaseProvider {
  DefaultData defaultData = DefaultData();
  final String dbName = 'yonunca.db';
  static DatabaseProvider instance = DatabaseProvider._init();
  final int dbVersion = 1;

  //2º method, with an unnamed constructor
  //static DatabaseProvider instances = DatabaseProvider(); [delete the ._inti()]

  static Database? _database;
  DatabaseProvider._init();

  ///Get the [database] if it exists, if not then create it
  Future<Database> get database async {

    if (_database != null) {
      return _database!;
    }
    _database = await _initializeDatabase();
    return _database!;
  }

  Future<Database> _initializeDatabase() async {
    final dbPath = await getDatabasesPath();
    final route = join(dbPath, dbName);
    return await openDatabase(route, version: dbVersion,onCreate: _createDb,onUpgrade: _onUpgrade);
  }
  Future _onUpgrade(Database database,int oldVersion, int newVersion) async{
    //Maybe update the questions
  }

  Future _createDb(Database database,int version) async{
    //The category table id's will not be AUTOINCREMENT because id[1,2,3]
    //are already used in the default category.json file
    //The first categoryId added will be [4]
    String categorySql = '''
      CREATE TABLE "category" (
	      "id"	INTEGER NOT NULL,
	      "description"	TEXT NOT NULL,
	      "imageRoute" TEXT NOT NULL,
	    PRIMARY KEY("id" AUTOINCREMENT)
     );
    ''';
    String questionSql = '''
      CREATE TABLE "question" (
	      "id"	INTEGER NOT NULL UNIQUE,
	      "categoryId"	INTEGER NOT NULL,
	      "description"	TEXT NOT NULL,
	      "isFavourite"	INTEGER,
	      PRIMARY KEY("id" AUTOINCREMENT),
	      FOREIGN KEY("categoryId") REFERENCES "category"("id") ON UPDATE CASCADE ON DELETE CASCADE
      );
    ''';

    //execute the sql sentences
    try{
      Batch batch = database.batch();
      dev.log("---------------CREATING TABLES-----------------");
      //Category
      await database.execute(categorySql);
      dev.log("Category table created");
      //Question
      await database.execute(questionSql);
      dev.log("Question table created");
      dev.log("Inserting data into category table...");
      dev.log("---------------ALL TABLES CREATED--------------------");

      //Insert default values
      await _insertDefaultValuesInBatch(batch);

    }on DatabaseException catch (ex){
      dev.log(ex.toString());
    }
  }

  _insertDefaultValuesInBatch(Batch batch) async{
    //INSERT DEFAULT VALUES
    //apparently there is no need to commit the batch here because the onCreate
    // method is already in a transaction
    List<Category> categories = defaultData.getCategoriesList;
    List<Question> normalQuestions = defaultData.getNormalQuestionsList;
    List<Question>  intermediateQuestions = defaultData.getIntermediateQuestionsList;
    List<Question>  hotQuestions = defaultData.getHotQuestionsList;

    dev.log("Inserting data into category table...");
    for (var element in categories) {
      //Category category = Category.fromMap(element);
      batch.insert('category', element.toMap());
    }
    dev.log("Inserting data into question table...");
    for (var element in normalQuestions) {
      batch.insert('question', element.toMap());
    }
    for (var element in intermediateQuestions) {
      batch.insert('question', element.toMap());
    }
    for (var element in hotQuestions) {
      batch.insert('question', element.toMap());
    }
    var result = batch.commit();
    result.whenComplete(() => dev.log('Questions added'));
  }

  Future close() async{
    if(_database != null){
      _database = null;
    }
    _database = null;
  }
}
