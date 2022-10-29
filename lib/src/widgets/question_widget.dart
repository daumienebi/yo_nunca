import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionWidgetState();
  }
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _questionTextWidget(Colors.blueGrey),
            SizedBox(height: 10),
            _nextButton()
          ]
      ),
    );
  }

  Widget _questionTextWidget(Color bgcolor){
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/blurBW.png'),
              fit: BoxFit.contain,
              opacity: 200
          ),
        //color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: bgcolor.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: 300,
      width: 300,
      child: Center(
        child: const Text(
          "Yo nunca he visto a Damian en persona ",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 19,
              color: Colors.black,
              fontFamily: 'Abel'),
        ),
      ),
    );
  }

  Widget _nextButton() {
    return TextButton(
        onPressed: () {},
        child: Text('Siguiente',
          style: TextStyle(fontSize: 15,color: Colors.black),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.lightGreenAccent,
          fixedSize: Size(100,40)
        ),
    );
  }
}
