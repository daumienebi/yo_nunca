//Dummy data class; will be deleted later on
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/questions.dart';

class TestData {
  List<Question> _questionsList = [];
  List<Category> _categoriesList = [];

  List<Question> get questionsList{
    return _getQuestions();
  }

  List<Question> get categoriesList{
    return _getCategories();
  }

  _getQuestions() {
    return _questionsList = questions.map((e) => Question.fromMap(e)).toList();
  }
  _getCategories() {
    return _categoriesList = categories.map((e) => Category.fromMap(e)).toList();
  }



  final categories = [
    {'id': '1', 'description': 'Normal'},
    {
      'id': '2',
      'description': 'Intermedio/Mezcla',
    },
    {
      'id': '3',
      'description': 'Caliente',
    },
  ];
  final questions = [
    {
      'id': '1',
      'categoryId': '1',
      'description': 'Dummy text dummy text dummy text dummy 1',
      'isFavourite': '1',
    },
    {
      'id': '2',
      'categoryId': '1',
      'description': 'Dummy text dummy text dummy text dummy 2',
      'isFavourite': '1',
    },
    {
      'id': '3',
      'categoryId': '2',
      'description': 'Dummy text dummy text dummy text dummy 3',
      'isFavourite': '0',
    },
    {
      'id': '4',
      'categoryId': '3',
      'description': 'Dummy text dummy text dummy text dummy 4',
      'isFavourite': '1',
    },
    {
      'id': '5',
      'categoryId': '3',
      'description': 'Dummy text dummy text dummy text dummy 5',
      'isFavourite': '0',
    }
  ];

  //Credits
  //NormalImage <a href="https://www.freepik.com/free-photo/friends-clinking-drink-glasses-modern-bar_5600264.htm#query=friends%20party&position=3&from_view=keyword">Image by jcomp</a> on Freepik

  /*
  * Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          height: 300,
          width: 300,
          child: Center(child: const Text("Yo nunca he dicho Damian ",textAlign: TextAlign.justify,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30, color: Colors.grey),)),
        ),
      ),
  *
  * */

}
