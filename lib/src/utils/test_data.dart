//Dummy data class; will be deleted later on
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';

class TestData {
  List<Question> _questionsList = [];
  List<Category> _categoriesList = [];
  List<Question> _favouritesList = [];

  List<Question> get getQuestionsList => _getQuestions();
  List<Question> get getCategoriesList => _getCategories();
  List<Question> get getFavouritesList => _getFavourites();

  _getFavourites() {
    return _favouritesList = favourites.map((e) => Question.fromMap(e)).toList();
  }

  _getQuestions() {
    return _questionsList = questions.map((e) => Question.fromMap(e)).toList();
  }

  _getCategories() {
    return _categoriesList = categories.map((e) => Category.fromMap(e)).toList();
  }

  final defaultCategories = [
    {
      'id': '1',
      'description': 'NORMAL',
      'imageRoute' : 'assets/images/wine.jpg',
    },
    {
      'id': '2',
      'description': 'INTERMEDIO',
      'imageRoute' : 'assets/images/shots.jpg',
    },
    {
      'id': '3',
      'description': 'CALIENTE',
      'imageRoute' : 'assets/images/smirk_face.png',
    },
  ];

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
      'isFavourite': false,
    },
    {
      'id': '2',
      'categoryId': '1',
      'description': 'Dummy text dummy text dummy text dummy 2',
      'isFavourite': true,
    },
    {
      'id': '3',
      'categoryId': '2',
      'description': 'Dummy text dummy text dummy text dummy 3',
      'isFavourite': false,
    },
    {
      'id': '4',
      'categoryId': '3',
      'description': 'Dummy text dummy text dummy text dummy 4',
      'isFavourite': true,
    },
    {
      'id': '5',
      'categoryId': '3',
      'description': 'Dummy text dummy text dummy text dummy 5',
      'isFavourite': false,
    }
  ];

  final favourites = [
    {
      'id': 1,
      'categoryId': 1,
      'description': 'Favorito 1',
      'isFavourite': true,
    },
    {
      'id': 2,
      'categoryId': 1,
      'description': 'Favorito 2',
      'isFavourite': false,
    },
    {
      'id': 3,
      'categoryId': 2,
      'description': 'Favorito 3',
      'isFavourite': true,
    },
    {
      'id': 4,
      'categoryId': 3,
      'description': 'Favorito 4',
      'isFavourite': true,
    },
    {
      'id': 5,
      'categoryId': 3,
      'description': 'Favorito 5',
      'isFavourite': true,
    }
  ];


/*
* Search bar in AppBar, Badge needs to be imported
* Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(
              const Radius.circular(
                10.0,
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(
              const Radius.circular(
                10.0,
              ),
            ),
          ),
          hintText: 'Search petients,transcript,contacts',
          prefixIcon: Icon(
            Icons.menu,
          ),
          suffixIcon: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 8,
                ),
                child: Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
              Positioned(
                right: 15,
                child: Badge(
                  shape: BadgeShape.circle,
                  badgeColor: Colors.red,
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  badgeContent: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
        ),
      ),
    ),
  ),
* */
}
