// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/widgets/widgets.dart';

class MixedModePage extends StatelessWidget{
  const MixedModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //In this case, a category with ID:0 will be received
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
        body: QuestionWidget(category: category,mixedMode: true,)
    );
  }
}