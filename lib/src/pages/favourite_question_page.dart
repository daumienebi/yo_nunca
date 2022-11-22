
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/widgets/widgets.dart';

class FavouriteQuestionPage extends StatelessWidget{
  const FavouriteQuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text('FAVORITAS ❤️'),
        gradient: const LinearGradient(
            colors: [Colors.amber, Colors.white70, Colors.amber]),
      ),
      body: const FavouriteQuestionCard()
    );
  }

}