// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/messages.dart';
import 'dart:developer' as dev;
import 'dart:math';

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
  List<Question> questions = []; //The questions for each category
  int _currentIndex = 0; //the current question index

  /// [gameOrder] creates a list of random numbers for each question which will
  /// be used as the [_currentIndex] to iterate through the [questions].
  /// The game order changes each time the user selects a [Category].
  /// This makes almost every game unique and helps to avoid repeated questions.
  List<int> gameOrder = [];

  final ValueNotifier<bool> isPotrait = ValueNotifier<bool>(true);

  Future<List<Question>> _getQuestions() async{
    QuestionProvider provider =
        Provider.of<QuestionProvider>(context, listen: true);
    if (widget.mixedMode) {
      await provider.getAllQuestions();
      questions = provider.questions;
      _generateGameOrder(questions);
      //3 seconds as wait time so that the user can read the loading screen
      //to see that questions from all categories will be loaded.
      return Future.delayed(Duration(seconds: 3), () => questions);
    } else {
      questions = await provider.getQuestionsPerCategory(widget.category.id!);
      _generateGameOrder(questions);
      return Future<List<Question>>.delayed(
          const Duration(seconds: 1), () => questions);
    }
  }

  /// Generate a random order in which the questions will be shown
  /// [questions] is the list of questions to be shown
  void _generateGameOrder(List<Question> questions){
    while(gameOrder.length != questions.length){
      gameOrder.add(Random().nextInt(questions.length));
    }
    dev.log('game order :' + gameOrder.toString());
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        isPotrait.value = orientation == Orientation.portrait;
        return Center(
          child: FutureBuilder(
              future: _getQuestions(),
              builder: (_, AsyncSnapshot snapshot) {
                List<Widget> futureWidgets = [];
                if (snapshot.hasData) {
                  //if data is available then display the questions(set the list
                  // of widgets to the questions), else display the error page.
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
                    Messages.circularLoadingWidget(widget.mixedMode ?
                    'Cargando preguntas de todas las categorías...' :
                    'Cargando preguntas ...'),
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

  /// Parent container for the fav button,question textWidget and the Previous
  /// & Next Button
  _questionContainerWidget(AsyncSnapshot snapshot) {
    //Begin the game with a random index instead of 0
    //displays this widget when data is received
    return <Widget>[
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _questionTextWidget(snapshot.data[gameOrder[_currentIndex]]),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _previousQuestionButton(),
            SizedBox(width: 25),
            _nextQuestionButton(snapshot.data.length)
          ],
        )
      ])
    ];
  }

  /// Displays this widget when no data is received or when the category has
  /// no questions
  _noQuestionWidget() {
    String part1 = 'No hay preguntas disponibles para la categoría ';
    String part2 = ', ve a las categorías para añadirlas.';
    final textStyle = TextStyle(color: Colors.black54,fontSize: 17);
    return <Widget>[
      Padding(
        padding: EdgeInsets.all(10),
        child: Center(
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
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, Constants.routes.categoryListPage);
        },
        child: Text('Ir a Categorías',style: TextStyle(color: Colors.black87),
        ),
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
    SnackBar snackBar;
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

  Widget _previousQuestionButton() {
    //Previous question button
    final btnStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 17));
    return ElevatedButton(
      onPressed: () {
        //Only go back to the previous question if it's not the first one
        if(_currentIndex > 0){
          setState(() {
            _currentIndex --;
          });
        }
      },
      child: Text('Anterior'),
      style: btnStyle,
    );
  }

  /// [listLength] - to obtain the length of the questions list
  Widget _nextQuestionButton(int listLength) {
    final btnStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 17));
    return ElevatedButton(
      onPressed: (){
        if(_currentIndex < listLength - 1){
          setState((){
            _currentIndex ++;
          });
        }
      },
      child: Text('Siguiente'),
      style: btnStyle,
    );
  }
}
