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
            _questionTextWidget(Colors.grey),
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
              image: AssetImage('assets/images/cold_beer2.jpg'),
              fit: BoxFit.fill,
              opacity: 230
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
    final btnStyle = ElevatedButton.styleFrom(textStyle: TextStyle(color: Colors.blue,fontSize: 20));
    return ElevatedButton(
        onPressed: () {},
        child: Text('Siguiente'),
        style: btnStyle
    );
  }
}
