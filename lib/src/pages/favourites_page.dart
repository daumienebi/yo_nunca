import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/utils/constants.dart';

class FavouritesPage extends StatelessWidget{
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text('Favoritos'),
        gradient: const LinearGradient(colors: [Colors.amberAccent,Colors.amberAccent,Colors.white]),//Change it later
      ),
    );
  }

}