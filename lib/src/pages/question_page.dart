import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class QuestionPage extends StatelessWidget{
  const QuestionPage({Key? key}) : super(key: key);

  //-- This shit should be for the stateless widget, not the whole page
  //final String pageTitle;
  //const QuestionPage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String gameMode = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(gameMode),
        gradient: const LinearGradient(colors: [Colors.amberAccent,Colors.amberAccent,Colors.white]),//Change it later
      ),
    );
  }

}