import 'package:flutter_test/flutter_test.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/providers/category_provider.dart';

/* Revise them
void main(){
  //WidgetsFlutterBinding.ensureInitialized();
  TestWidgetsFlutterBinding.ensureInitialized();
  group("Testing the category funtions", (){
    CategoryProvider categoryProvider = CategoryProvider();

    //Test 1
    test("A new category should be added", () async{
      Category category = Category(id: 1,description: "Test Category",imageRoute: "");
      categoryProvider.addCategory(category);
      bool categoryExists = await categoryProvider.categoryExists(category.description);
      expect(categoryExists,true);
    });

    //Test 2
    test("The added category should be removed", () async{
      Category category = Category(id: 2,description: "Test Category Remove",imageRoute: "");

      //Add the category
      categoryProvider.addCategory(category);
      bool categoryExists = await categoryProvider.categoryExists(category.description);
      expect(categoryExists,true);

      //Remove the category
      categoryProvider.deleteCategory(category);
      bool categoryExists2 = await categoryProvider.categoryExists(category.description);
      expect(categoryExists2,true);
    });
  });

}
*/