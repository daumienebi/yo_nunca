import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/utils/constants.dart';
import 'package:yo_nunca/src/widgets/widgets.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //physics: const AlwaysScrollableScrollPhysics(),
    return Scaffold(
      drawer: MyDrawer(),
      appBar: NewGradientAppBar(
        title: Text(Constants.title),
        gradient: const LinearGradient(colors: [Colors.white,Colors.amberAccent,Colors.white]),//Change it later
      ),
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomePageList()
            ],
          ),
        ),
      ),
    );
  }

}