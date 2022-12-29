// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/ui/widgets/widgets.dart';

class MixedModePage extends StatelessWidget{
  const MixedModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //In this case, a category with ID:0 will be received
    Category category = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
        appBar: RoundAppBar(title: Text(category.description,style: TextStyle(
          fontWeight: FontWeight.w400,
        ),),homePage: false,),
        body: QuestionWidget(category: category,mixedMode: true,)
    );
  }
}