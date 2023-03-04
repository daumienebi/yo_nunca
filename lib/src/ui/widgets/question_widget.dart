// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:yo_nunca/src/utils/messages.dart';
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
  int currentIndex = 0; //the current question index

  /// [gameOrder] creates a list of random numbers for each question which will
  /// be used as the [currentIndex] to iterate through the [questions].
  /// The game order changes each time the user selects a [Category].
  /// This makes almost every game unique and helps to avoid repeated questions.
  List<int> gameOrder = [];

  late int numberOfQuestions;

  final ValueNotifier<bool> isPotrait = ValueNotifier<bool>(true);

  Future<List<Question>> getQuestionsFuture() async{
    QuestionProvider provider =
        Provider.of<QuestionProvider>(context, listen: true);
    if (widget.mixedMode) {
      await provider.getAllQuestions();
      questions = provider.questions;
      generateGameOrder(questions);
      numberOfQuestions = questions.length;
      //3 seconds as wait time so that the user can read the loading screen
      //to see that questions from all categories will be loaded.
      return Future.delayed(Duration(seconds: 3), () => questions);
    } else {
      questions = await provider.getQuestionsPerCategory(widget.category.id!);
      generateGameOrder(questions);
      numberOfQuestions = questions.length;
      return Future<List<Question>>.delayed(
          const Duration(seconds: 1), () => questions);
    }
  }

  /// Generate a random order in which the questions will be displayed
  /// [questions] is the list of questions to be shown
  void generateGameOrder(List<Question> questions){
    late int randomNumber;
    while(gameOrder.length != questions.length){
      randomNumber = Random().nextInt(questions.length);
      //make sure the game order does not have repeated number
      if(!gameOrder.contains(randomNumber)){
        gameOrder.add(randomNumber);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        isPotrait.value = orientation == Orientation.portrait;
        return Center(
          child: FutureBuilder(
              future: getQuestionsFuture(),
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
                    Messages.errorWidget(AppLocalizations.of(context)!.questionsCouldNotBeLoaded),
                  ];
                } else {
                  futureWidgets = <Widget>[
                    Messages.circularLoadingWidget(widget.mixedMode ?
                    AppLocalizations.of(context)!.loadingQuestionsFromAllCategories :
                    AppLocalizations.of(context)!.loadingQuestions),
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
        _questionTextWidget(snapshot.data[gameOrder[currentIndex]]),
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
    String part1 = AppLocalizations.of(context)!.noQuestionWidgetPart1;
    String part2 = AppLocalizations.of(context)!.noQuestionWidgetPart2;
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
          Navigator.pushNamed(context, AppRoutes.routeStrings.categoryListPage);
        },
        child: Text(
          AppLocalizations.of(context)!.goToCategories,
          style: TextStyle(
              color: Colors.black87
          ),
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
              snackBar = SnackBar(
                duration: Duration(seconds: 1),
                content: Text(AppLocalizations.of(context)!.questionDeletedFromFavourites),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              question.isFavourite = true;
              await provider.addToFavourites(question);
              snackBar = SnackBar(
                duration: Duration(seconds: 1),
                content: Text(AppLocalizations.of(context)!.questionAddedToFavourites),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            setState(() {});//to rebuild the widget
          },
          child: question.isFavourite ? likedIcon : unLikedIcon,
        ),
        // (currentIndex + 1) because the index starts at "0" but we want the
        // user to see "1"
        Padding(
          padding: EdgeInsets.all(5),
            child: Text('${currentIndex + 1} / $numberOfQuestions',
              style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'OoohBaby',
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            )
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
              height: isPotrait.value == true ? 350 : 150,
              width: isPotrait.value == true ? 320 : 420,
              child: Center(
                child: Text(
                  question.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 21, color: Colors.black87, fontFamily: 'Abel'),
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
      key: Key('previousButton'),
      onPressed: () {
        //Only go back to the previous question if it's not the first one
        if(currentIndex > 0){
          setState(() {
            currentIndex --;
          });
        }
      },
      child: Text(AppLocalizations.of(context)!.previous),
      style: btnStyle,
    );
  }

  /// [listLength] - to obtain the length of the questions list
  Widget _nextQuestionButton(int listLength) {
    final btnStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 17));
    return ElevatedButton(
      key: Key('nextButton'),
      onPressed: (){
        if(currentIndex < listLength - 1){
          setState((){
            currentIndex ++;
          });
        }
      },
      child: Text(AppLocalizations.of(context)!.next),
      style: btnStyle,
    );
  }
}
