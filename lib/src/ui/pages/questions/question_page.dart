// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/ui/components/components.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Category category = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
        appBar: CustomAppBar(
          title: Text(
            category.description,
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          homePage: false,
        ),
        //[mixedMode] is false because this widget is used to display questions for each category
        body: QuestionWidget(
          category: category,
          mixedMode: false,
        )
    );
  }
}
