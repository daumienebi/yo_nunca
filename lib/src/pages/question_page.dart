// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/widgets/widgets.dart';

class QuestionPage extends StatelessWidget{
  const QuestionPage({Key? key}) : super(key: key);

  //-- This shit should be for the stateless widget, not the whole page
  //final String pageTitle;
  //const QuestionPage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Category category = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(category.description,style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w400,
          ),

        ),
        gradient: const LinearGradient(colors: [Colors.amber,Colors.white70,Colors.amber]),//Change it later
      ),
        backgroundColor: Colors.orange[50],
      body: QuestionWidget(category: category,mixedMode: false,)
    );
  }
}