import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/messages.dart';
import 'dart:developer' as dev;

class QuestionWidget extends StatefulWidget {
  final Category category;
  final bool mixedMode;
  const QuestionWidget(
      {Key? key, required this.category, required this.mixedMode})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionWidgetState();
  }
}

class _QuestionWidgetState extends State<QuestionWidget> {
  List<Widget> questionWidgets = [];
  List<Question> questions = [];
  int _currentndex = 0;
  final ValueNotifier<bool> isPotrait = ValueNotifier<bool>(true);

  Future<List<Question>> _getQstData() async{
    QuestionProvider provider =
        Provider.of<QuestionProvider>(context, listen: true);

    if (widget.mixedMode) {
      dev.log("Mixed mode");
      await provider.getAllQuestions();
      questions = provider.questions;
      //dev.log(questions.toString());
      return Future.delayed(Duration(seconds: 2), () => questions);
    } else {
      dev.log("category mode");
      questions = await provider.getQuestionsPerCategory(widget.category.id!);
      return Future<List<Question>>.delayed(
          const Duration(seconds: 1), () => questions);
    }
  }

  @override
  Widget build(BuildContext context) {
    //QuestionProvider provider =
    //Provider.of<QuestionProvider>(context, listen: true);
    // TODO: implement build
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        isPotrait.value = orientation == Orientation.portrait;
        return Center(
          child: FutureBuilder(
              future: _getQstData(),
              builder: (_, AsyncSnapshot snapshot) {
                List<Widget> futureWidgets = [];
                if (snapshot.hasData) {
                  //if data is available then display the questions(set the list of widgets to the questions), else display the error page
                  futureWidgets =
                      snapshot.data != null && snapshot.data.length > 0
                          ? _questionContainerWidget(snapshot)
                          : _noQuestionWidget();
                } else if (snapshot.hasError) {
                  futureWidgets = <Widget>[
                    Messages.errorWidget(
                        'No se pudieron cargar las preguntas :('),
                  ];
                } else {
                  futureWidgets = <Widget>[
                    Messages.circularLoadingWidget(widget.mixedMode ? 'Cargando preguntas de todas las categorías...' : 'Cargando preguntas ...'),
                  ];
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: futureWidgets,
                  ),
                );
              }),
        );
      },
    );
  }

  ///Parent container for the fav button,question textWidget and the Previous & Next Button
  _questionContainerWidget(AsyncSnapshot snapshot) {
    //displays this widget when data is received
    return <Widget>[
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //if data is available then display the questions, else display the error page
        //snapshot.data != null && snapshot.data.length > 0
        //? _questionTextWidget(snapshot.data[_currentndex])
        //: _noQuestionWidget(),
        _questionTextWidget(snapshot.data[_currentndex]),
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
    String part1 = 'No hay preguntas disponibles para la categoría ';
    String part2 = ', ve a las categorias para añadirlas.';
    final textStyle = TextStyle(color: Colors.black54,fontSize: 17);
    return <Widget>[
      Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/question.png',scale: 8,),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                text: part1,
                style: textStyle,
                children: [
                  TextSpan(text : widget.category.description,
                    style: TextStyle(

                      fontSize: 17,
                      color: Colors.redAccent[200],
                      fontWeight: FontWeight.bold
                    ),),
                  TextSpan(text : part2,
                    style: textStyle
                  )
                ]
              ),)
            ],
          )
      ),
      //Messages.errorWidget2(errorMessage, null, 0.5),
      SizedBox(height: 20,),
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, Constants.routes.categoryListPage);
        },
        child: Text('Ir a Categorias'),
        style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
      )
    ];
  }

  Widget _questionTextWidget(Question question) {
    Icon likedIcon = Icon(
      Icons.favorite,
      color: Colors.red,
      size: 40,
    );
    Icon unLikedIcon = Icon(
      Icons.favorite_border,
      size: 40,
    );
    var snackBar;
    return Consumer(
      builder: (_, QuestionProvider provider, __) => Column(children: [
        //like and unlike icon
        TextButton(
          onPressed: () async{
            if (question.isFavourite) {
              question.isFavourite = false;
              await provider.removeFromFavourites(question);
              dev.log(question.isFavourite.toString());
              snackBar = SnackBar(
                duration: Duration(seconds: 1),
                content: const Text('Pregunta eliminada de favoritos'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              question.isFavourite = true;
              await provider.addToFavourites(question);
              dev.log(question.isFavourite.toString());
              snackBar = SnackBar(
                duration: Duration(seconds: 1),
                content: const Text('Pregunta añadida a favoritos'),
              );
              //dev.log(question.isFavourite.toString());
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            setState(() {});//to rebuild the widget
          },
          child: question.isFavourite ? likedIcon : unLikedIcon,
        ),
        //question description
        ValueListenableBuilder(
          valueListenable: isPotrait,
          builder: (BuildContext context, _, Widget? child) {
            return Container(
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
              height: isPotrait.value == true ? 320 : 150,
              width: isPotrait.value == true ? 320 : 420,
              child: Center(
                child: Text(
                  question.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: Colors.black, fontFamily: 'Abel'),
                ),
              ),
            );
          },
        ),
      ]),
    );
  }

  Widget _prevQstButton() {
    //Previous question button
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

  /// [listLength] - to obtain the length of the questions list
  Widget _nextQstButton(int listLength) {
    //Button for next question
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
