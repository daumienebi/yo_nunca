import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:yo_nunca/src/database/database_provider.dart';

class TestUtils{

  //Incase a raw query need to be executed
  static late Database database;

  static sqlFliteSetUpForTest(){
    // Setup sqflite_common_ffi for flutter test
    DatabaseProvider databaseProvider = DatabaseProvider.instance;

    setUpAll(() async{
      // Initialize FFI
      sqfliteFfiInit();

      // Change the default factory for unit testing calls for SQFlite
      databaseFactory = databaseFactoryFfi;
      database = await databaseProvider.database;
    });

    tearDownAll(() async{
      //database.delete('category'); //Delete the data in the table
      // Maybe delete the database here
      //await databaseProvider.deleteDatabase();
      //await databaseFactory.deleteDatabase(await databaseFactory.getDatabasesPath());
    });
  }

}