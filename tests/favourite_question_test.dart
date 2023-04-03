import 'package:flutter_test/flutter_test.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';

// Revise them
void main(){
  TestWidgetsFlutterBinding.ensureInitialized();
  QuestionProvider provider = QuestionProvider();
  test("Add a question to favourites", () async{
    Question question = Question(id: 1,categoryId: 1,description: "AAA",isFavourite: false);
    int rows = await provider.addToFavourites(question);
    expect(rows, 1);
  });
}