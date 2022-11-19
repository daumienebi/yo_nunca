import 'dart:math';
import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/constants.dart';

class QuestionWidget extends StatefulWidget {
  final Category category;
  const QuestionWidget({Key? key, required this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionWidgetState();
  }
}

class _QuestionWidgetState extends State<QuestionWidget> {
  List<Widget> questionWidgets = [];
  List<Question> questions = [];
  int _currentndex = 0;

  /*
  @override
  void initState() {
    _loadCards();
    super.initState();
  }
*/
  Future<List<Question>> _getQstData() {
    QuestionProvider provider =
        Provider.of<QuestionProvider>(context, listen: false);

    switch (widget.category.id) {
      case Constants.normalCategoryId:
        {
          questions = provider.normalQuestions;
          return Future<List<Question>>.delayed(
              const Duration(seconds: 1), () => questions);
        }
        break;
      case Constants.intermediateCategoryId:
        {
          questions = provider.intermediateQuestions;
          return Future<List<Question>>.delayed(
              const Duration(seconds: 1), () => questions);
        }
        break;
      case Constants.hotCategoryId:
        {
          questions = provider.hotQuestions;
          return Future<List<Question>>.delayed(
              const Duration(seconds: 1), () => questions);
        }
        break;
      default:
        {
          print(widget.category.id);
          return Future<List<Question>>.delayed(
              const Duration(seconds: 2), () => []);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    QuestionProvider provider =
        Provider.of<QuestionProvider>(context, listen: true);
    // TODO: implement build
    return Center(
      child: FutureBuilder(
          future: _getQstData(),
          builder: (_, AsyncSnapshot snapshot) {
            List<Widget> test = [];
            if (snapshot.hasData) {
              test = snapshot.data != null && snapshot.data.length > 0
                  ? _questionContainerWidget(snapshot)
                  : _noQuestionWidget();
            } else if (snapshot.hasError) {
              test = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: No se pudo cargar las preguntas :('),
                ),
              ];
            } else {
              test = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('Cargando preguntas...'),
                ),
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: test,
              ),
            );
          }),
    );
  }

  _questionContainerWidget(AsyncSnapshot snapshot) {
    //displays this widget when data is received
    return <Widget>[
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //if data is available then display the questions, else display the error page
        snapshot.data != null && snapshot.data.length > 0
            ? _questionTextWidget(snapshot.data[_currentndex])
            : _noQuestionWidget(),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _prevQstButton(),
            SizedBox(width: 25),
            _nextQstButton(snapshot.data.length)
          ],
        )
      ])
    ];
  }

  _noQuestionWidget() {
    //displays this widget when no data is received or when the category has
    //no questions
    String errorMessage =
        'No hay preguntas para la categoría : ${widget.category.description}, ve a las categorias para añadirlas.';
    return <Widget>[
      Container(
        height: 250,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.red[200],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.black54,
                size: 50,
              ),
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      _goToCategoriesBtn()
    ];
  }

  Widget _goToCategoriesBtn() {
    return ElevatedButton(
      onPressed: () {
        print("TODO: Go to categories");
      },
      child: Text('Ir a Categorias'),
      style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
    );
  }

  Widget _questionTextWidget(Question question) {
    Icon likedIcon = Icon(Icons.favorite,color: Colors.red,size: 40,);
    Icon unLikedIcon = Icon(Icons.favorite_border,size: 40,);
    var snackBar;
    return Consumer(
      builder:(_,QuestionProvider provider,__) => Column(
          children: [
        //like and unlike icon
        TextButton(
          onPressed: () {
            setState(() {
              if(question.isFavourite){
                provider.removeFromFavourites(question);
                question.isFavourite = false;
                snackBar = SnackBar(
                  content: const Text('Pregunta añadida a favoritos'),
                  action: SnackBarAction(
                    label: 'Deshacer',
                    onPressed: () {
                      setState(() {
                        question.isFavourite = true;
                        provider.addToFavourites(question);
                      });
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }else{
                provider.addToFavourites(question);
                question.isFavourite = true;
                snackBar = SnackBar(
                  content: const Text('Pregunta eliminada de favoritos'),
                  action: SnackBarAction(
                    label: 'Deshacer',
                    onPressed: () {
                      setState(() {
                        provider.removeFromFavourites(question);
                        question.isFavourite = false;
                      });
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            });
          },
          child: question.isFavourite ? likedIcon : unLikedIcon,
        ),
        SizedBox(height: 10),
        //question description
        Container(
          decoration: BoxDecoration(
            color: Colors.teal[100],
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 3))
            ],
          ),
          height: 320,
          width: 320,
          child: Center(
            child: Text(
              question.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Colors.black, fontFamily: 'Abel'),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _prevQstButton() {
    final btnStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 17));
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (_currentndex > 0) {
            print("current index: $_currentndex");
            _currentndex--;
          }
        });
      },
      child: Text('Anterior'),
      style: btnStyle,
    );
  }

  Widget _nextQstButton(int listLength) {
    final btnStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 17));
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (_currentndex < listLength - 1) {
            print("current index: $_currentndex");
            _currentndex++;
          }
        });
      },
      child: Text('Siguiente'),
      style: btnStyle,
    );
  }
}
