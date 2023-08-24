// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:yo_nunca/src/ui/components/components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavouriteQuestionPage extends StatelessWidget{
  const FavouriteQuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: CustomAppBar(title: Text(AppLocalizations.of(context)!.favouriteQuestions),homePage: false,),
      body: const FavouriteQuestionCard()
    );
  }

}