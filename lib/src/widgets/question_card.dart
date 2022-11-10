import 'dart:developer' as dev;
import 'package:appinio_swiper/appinio_swiper.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:yo_nunca/src/utils/constants.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  final List<Widget> cards = [];

  @override
  void initState() {
    if (cards.isEmpty) {
      _loadCards();
    }
    super.initState();
  }

  void _loadCards() {
    cards.add(_testCard("Yo nunca he utilizado Visual Studio Code.", true));
    cards.add(_testCard("Yo nunca he utilizado Android Studio.", false));
    cards.add(_testCard("Yo nunca he utilizado Netbeans.", true));
    cards.add(_testCard("Yo nunca he utilizado un bucle FOR.", false));
    cards.add(_testCard("Yo nunca he yo nunca.", true));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_questionTextCard(), SizedBox(height: 10), _nextButton()]),
    );
  }

  Widget _questionTextCard() {
    final AppinioSwiperController controller = AppinioSwiperController();
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
  }

  Widget _testCard(String qst, bool isFav) {
    //create a fake future before loading the cards
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        //color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            //color: Colors.greenAccent.withOpacity(0.6),
            color: Constants.randomColours.elementAt(Random().nextInt(Constants.randomColours.length)).withOpacity(0.95)
            // changes position of shadow
          ),
        ],
      ),
      child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  qst,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23, color: Colors.white,fontWeight: FontWeight.w800, fontFamily: 'Abel'),
                ),
              ),
            ),
          ]),
    );
  }



  void _swipe(int index, AppinioSwiperDirection direction) {
    //try to get the current card after swiped
    dev.log("the card was swiped to the: " + direction.name);
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      dev.log("SUCCESS: card was unswiped");
    } else {
      dev.log("FAIL: no card left to unswipe");
    }
  }

  Widget _nextButton() {
    final btnStyle = ElevatedButton.styleFrom(
        textStyle: TextStyle(color: Colors.blue, fontSize: 20));
    return ElevatedButton(
      onPressed: () {
        if (cards.isEmpty) {
          setState(() {
            _loadCards();
          });
        }
        //print("swipe");
      },
      child: Text('Siguiente'),
      style: btnStyle,
    );
  }


  /*
  Widget _oldShit (String qst, bool isFav) {
    //create a fake future before loading the cards
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
            //image: AssetImage('assets/images/blurBW.png'), //Damian
            image: AssetImage('assets/images/red_cup.jpg'), //Damian
            fit: BoxFit.fill,
            opacity: 200),
        //color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            // changes position of shadow
          ),
        ],
      ),
      child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  qst,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23, color: Colors.white,fontWeight: FontWeight.w800, fontFamily: 'Abel'),
                ),
              ),
            ),
          ]),
    );
  }
  */
}
