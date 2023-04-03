import 'package:flutter_test/flutter_test.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/providers/category_provider.dart';
import 'test_utils.dart';

void main() async{
  TestWidgetsFlutterBinding.ensureInitialized();
  // Set up the sqflite_common_ffi for flutter test
  // Essential step, if not the tests will not run
  TestUtils.sqlFliteSetUpForTest();

  group("Category tests", (){
    CategoryProvider categoryProvider = CategoryProvider();
    // Test 1
    test("A new category should be added", () async{
      // Arrange
      Category category = Category(description: "Category 1",imageRoute: "");
      // Act
      await categoryProvider.addCategory(category);
      bool exists = await categoryProvider.categoryExists(category.description);
      // Assert
      expect(exists,true);
    });

    // Test 2
    test("Add a new category and later delete it", () async{
      // Arrange
      Category category = Category(description: "Category 2",imageRoute: "");
      // Act
      int id = await categoryProvider.addCategory(category);
      bool exists = await categoryProvider.categoryExists(category.description);
      // Assert
      expect(exists,true);
      print(categoryProvider.newCategories);


      // Act
      //Set the id of the category since it is initially set to null
      category.id = id;
      await categoryProvider.deleteCategory(category);
      bool categoryExists = await categoryProvider.categoryExists(category.description);
      // Assert
      expect(categoryExists,false);
      print(categoryProvider.newCategories);
    });

    // Test 3
    test("Add a new category and modify it later on", () async{
      // Arrange
      Category category = Category(description: "Category 4",imageRoute: "");
      // Act
      int id = await categoryProvider.addCategory(category);
      bool exists = await categoryProvider.categoryExists(category.description);
      // Assert
      expect(exists,true);

      // Act
      category.id = id; //Must set the id to ensure that its not null
      category.description = "Category 4 Modified";
      await categoryProvider.modifyCategory(category);
      bool category4 = await categoryProvider.categoryExists("Category 4");
      bool category4Modified = await categoryProvider.categoryExists(category.description);

      expect(category4, false);
      expect(category4Modified, true);
    });

  });

}