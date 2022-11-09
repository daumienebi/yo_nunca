import 'dart:developer';
import 'package:appinio_swiper/appinio_swiper.dart';

import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

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
    cards.add(_testCard("Primera", false));
    cards.add(_testCard("Yo nunca he utilizado Visual Studio Code.", true));
    cards.add(_testCard("Yo nunca he utilizado Android Studio.", false));
    cards.add(_testCard("Yo nunca he utilizado Netbeans.", true));
    cards.add(_testCard("Yo nunca he utilizado un bucle FOR.", false));
    cards.add(_testCard("Yo nunca he yo nunca.", true));
    cards.add(_testCard("Ultima.", true));
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
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/cold_beer2.jpg'),
            fit: BoxFit.fill,
            opacity: 230),
        //color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
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
                  fontSize: 23, color: Colors.white,fontWeight: FontWeight.w800, fontFamily: 'Abel'),
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent[100],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            //color: Colors.white,
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              TextButton(
                onPressed: () {},
                child: isFav
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 45,
                      )
                    : Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 45,
                      ),
              ),
            ]))
      ]),
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    //try to get the current card after swiped
    log("the card was swiped to the: " + direction.name);
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      log("SUCCESS: card was unswiped");
    } else {
      log("FAIL: no card left to unswipe");
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
}

class _TestCard extends StatelessWidget {
  final String qst;
  const _TestCard({required this.qst});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(105)),
          ),
          height: 200,
          width: double.infinity,
          child: Center(
            child: Text(
              qst,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 23, color: Colors.black, fontFamily: 'Abel'),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/cold_beer2.jpg'),
                fit: BoxFit.fill,
                opacity: 230),
            //color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          color: Colors.white,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.favorite_border,
                size: 45,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.star,
                size: 45,
                color: Colors.black,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 45,
              )
            ],
          ),
        )
      ]),
    );
  }
}
