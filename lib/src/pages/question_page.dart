import 'package:flutter/cupertino.dart';
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/default_category.dart';
import 'package:yo_nunca/src/widgets/widgets.dart';

class QuestionPage extends StatelessWidget{
  const QuestionPage({Key? key}) : super(key: key);

  //-- This shit should be for the stateless widget, not the whole page
  //final String pageTitle;
  //const QuestionPage({Key? key, required this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //String gameMode = ModalRoute.of(context)!.settings.arguments as String;
    Category category = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(category.description),
        gradient: const LinearGradient(colors: [Colors.amber,Colors.white70,Colors.amber]),//Change it later
      ),
      //body: QuestionWidget()
      body: QuestionCard(category: category,)
    );
  }

  _blurContainer(){
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/blurBW.png'),
              fit: BoxFit.contain,
              opacity: 170
          )
      ),
      //child: Image.asset('assets/images/blur1.png'),
    );
  }
}