// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/ui/widgets/widgets.dart';
import 'package:yo_nunca/src/utils/constants.dart';

class FavouriteQuestionPage extends StatelessWidget{
  const FavouriteQuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: RoundAppBar(title: Text('Preguntas destacadas'),homePage: false,),
      body: const FavouriteQuestionCard()
    );
  }

}