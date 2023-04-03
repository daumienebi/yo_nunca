import 'package:flutter_test/flutter_test.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';

import 'test_utils.dart';

void main(){
  TestWidgetsFlutterBinding.ensureInitialized();
  // Set up the qflite_common_ffi for flutter test
  // Essential step, if not the tests will not run
  TestUtils.sqlFliteSetUpForTest();

  group("Favourites test", (){
    QuestionProvider questionProvider = QuestionProvider();
    CategoryProvider categoryProvider = CategoryProvider();

    // Test 1
    test("Add a question to favourites", () async{
      int categoryId,questionId;

      //Add a category for the new question
      Category category = Category(description: "Test Category X",imageRoute: "");
      categoryId = await categoryProvider.addCategory(category);

      Question question = Question(
          categoryId: categoryId,
          description: "Yo nunca hice un test",
          isFavourite: false
      );
      questionId = await questionProvider.addQuestion(question);
      question.id = questionId;
      //int rows = await questionProvider.addToFavourites(question);
      questionProvider.getFavouriteQuestions();
      expect(questionProvider.favouriteQuestions.length, 1);
      //Incorrect test, look into it
    });

  });
}