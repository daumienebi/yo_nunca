import 'dart:developer' as dev;
import 'package:appinio_swiper/appinio_swiper.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/providers/providers.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/utils/messages.dart';

class FavouriteQuestionCard extends StatefulWidget {
  const FavouriteQuestionCard({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _FavouriteQuestionCardState();
}

class _FavouriteQuestionCardState extends State<FavouriteQuestionCard> {
  List<Widget> cards = [];
  List<Question> questions = [];
  bool visible = false;
  int swipeIndex = 0;
  @override
  void initState() {
    _loadCards();
    super.initState();
  }

  Future<List<Question>> _getData() {
    //to simulate fake loading :)
    QuestionProvider provider = Provider.of<QuestionProvider>(context, listen: false);
    return Future.delayed(Duration(seconds: 2), () => questions);
  }

  void _loadCards() {
    QuestionProvider provider =
        Provider.of<QuestionProvider>(context, listen: false);
    questions = provider.favouriteQuestions;
    questions.forEach((question) {
      cards.add(_questionCard(question.description));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _questionAppinioSwiper(),
            SizedBox(height: 10),
            Visibility(child: _restartButton(), visible: visible)
          ]),
    );
  }

  Widget _questionAppinioSwiper() {
    //Added the future just to fake a loading screen, data will always be available in
    // the favourite list to create the new game
    final AppinioSwiperController controller = AppinioSwiperController();
    return FutureBuilder(
        future: _getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
          } else if (snapshot.hasError) {
            return Messages.errorWidget('Error: No se pudieron cargar las preguntas :(');
          } else {
            return Messages.circularLoadingWidget('Creando juego con preguntas favoritas...');
          }
          //main content to return with the data
          return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                child: AppinioSwiper(
                  unlimitedUnswipe: true,
                  controller: controller,
                  unswipe: _unswipe,
                  cards: cards,
                  onSwipe: _swipe,
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 50,
                    bottom: 40,
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget _questionCard(String qst) {
    //create a fake future before loading the cards
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Constants.randomColours
                  .elementAt(Random().nextInt(Constants.randomColours.length))
                  .withOpacity(0.95)),
        ],
      ),
      child: Column(children: [
        Container(
          height: 200,
          width: double.infinity,
          child: Center(
            child: Text(
              qst,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Abel'),
            ),
          ),
        ),
      ]),
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    dev.log("the card was swiped to the: " + direction.name);
    if (cards.isEmpty) {
      setState(() {
        visible = true;
      });
    } else {
      false;
    }
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      dev.log("SUCCESS: card was unswiped");
    } else {
      dev.log("FAIL: no card left to unswipe");
    }
  }

  Widget _restartButton() {
    final btnStyle = TextButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 20),
        backgroundColor: Colors.greenAccent);
    return ElevatedButton(
      onPressed: () {
        if (cards.isEmpty) {
          setState(() {
            _loadCards();
          });
        }
        //hide the Restart button after reloading the cards
        setState(() {
          visible = false;
        });
      },
      child: Text('Reiniciar'),
      style: btnStyle,
    );
  }
}
