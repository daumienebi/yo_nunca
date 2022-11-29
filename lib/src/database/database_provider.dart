import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  final String dbName = 'yonunca.db';
  final String favouriteTable = 'favourites';
  final String categoryTable = 'category';
  final String questionTable = 'question';
  static DatabaseProvider instance = DatabaseProvider._init();

  //Create the singleton pattern to ensure that the class only has one instance
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

    return await openDatabase(route, version: 1);
  }

  Future _createDb(Database database,int version) async{
    //The category table id's will not be AUTOINCREMENT because id[1,2,3]
    //are already used in the default category.json file
    //The first categoryId added will be [4]
    String categorySql = '''
      CREATE TABLE "category" (
	      "id"	INTEGER NOT NULL,
	      "description"	TEXT NOT NULL,
	    PRIMARY KEY("id")
     );
    ''';
    String questionSql = '''
      CREATE TABLE "question" (
	      "id"	INTEGER NOT NULL,
	      "categoryId"	INTEGER NOT NULL,
	      "description"	TEXT NOT NULL,
	      "isFavourite"	INTEGER,
	      "isDefault"	INTEGER,
	      PRIMARY KEY("id"),
	      FOREIGN KEY("categoryId") REFERENCES "category"("id") ON UPDATE CASCADE ON DELETE CASCADE
      );
    ''';
    String favouriteSql = '''
      CREATE TABLE "favouriteQuestions" (
	      "id"	INTEGER NOT NULL,
	      "questionId"	INTEGER NOT NULL,
	      "description"	TEXT NOT NULL,
	      PRIMARY KEY("id")
      );
    ''';

    //execute the sql sentences
    await database.execute(categorySql);
    await database.execute(questionSql);
    await database.execute(favouriteSql);
    await database.rawInsert('');
  }

  Future close() async{
    if(_database != null){
      _database = null;
    }
    _database = null;
  }
}
