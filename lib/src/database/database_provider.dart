import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
//import 'dart:developer' as dev;
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
    return await openDatabase(
        route,
        version: dbVersion,
        onCreate: _createDb,
        onUpgrade: _onUpgrade,
        onConfigure: _onConfigure,
    );
  }

  Future _onConfigure(Database db) async {
    //Allow the foreign keys for the database
    //So that all questions related to a category will also be deleted when
    //a category gets deleted
    await db.execute('PRAGMA foreign_keys = ON');
  }
  Future _onUpgrade(Database database,int oldVersion, int newVersion) async{
    // To add new questions or categories in the next update, add them to the
    // [DefaultData] class in the right list so that newer users can get them
    // too.

    //Changes in the Database queries :
    // Filter with the names of the default & newer Categories in the
    // [CategoryDao], to get the default ones instead of using 1,2,3 & 4 because
    // the user might have added newer categories.
  }

  Future _createDb(Database database,int version) async{
    //The first 3 default categories will have id[1,2 & 3]
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

    //Execute the sql sentences
    try{
      Batch batch = database.batch();
      //dev.log("---------------CREATING TABLES-----------------");
      //Category
      await database.execute(categorySql);
      //dev.log("Category table created");
      //Question
      await database.execute(questionSql);
      //dev.log("Question table created");
      //dev.log("Inserting data into category table...");
      //dev.log("---------------ALL TABLES CREATED---------------");

      //Insert default values
      await _insertDefaultValuesInBatch(batch);

    }on DatabaseException catch (ex){
      //dev.log(ex.toString());
    }
  }

  /// Inserts the default categories and questions from the [DefaultData] class
  _insertDefaultValuesInBatch(Batch batch) async{
    // Apparently there is no need to commit the batch here because the onCreate
    // method is already in a transaction
    List<Category> categories = defaultData.getCategoriesList;
    List<Question> normalQuestions = defaultData.getNormalQuestionsList;
    List<Question> intermediateQuestions = defaultData.getPartyQuestionsList;
    List<Question> coupleQuestions = defaultData.getCoupleQuestionsList;
    List<Question> hotQuestions = defaultData.getHotQuestionsList;

    //dev.log("Inserting data into category table...");
    for (var element in categories) {
      //Category category = Category.fromMap(element);
      batch.insert('category', element.toMap());
    }
    //dev.log("Inserting data into question table...");
    for (var element in normalQuestions) {
      batch.insert('question', element.toMap());
    }
    for (var element in intermediateQuestions) {
      batch.insert('question', element.toMap());
    }
    for (var element in coupleQuestions) {
      batch.insert('question', element.toMap());
    }
    for (var element in hotQuestions) {
      batch.insert('question', element.toMap());
    }
    var result = batch.commit();
    //result.whenComplete(() => dev.log('Questions added'));
  }

  Future close() async{
    if(_database != null){
      _database = null;
    }
    _database = null;
  }

  /// To be called during tests
  Future<void> deleteDatabase() async =>
      databaseFactory.deleteDatabase(await getDatabasesPath());
}
