import 'package:flutter/material.dart';

class Constants {
  static Routes routes = const Routes();
  static double homePageWidgetHeight = 200;
  static String title = 'YO NUNCA';
  static String playStoreUrl = "https://www.youtube.com";
  static const int normalCategoryId = 1;
  static const int intermediateCategoryId = 2;
  static const int hotCategoryId = 3;
  static List<Color>   randomColours = [
    Colors.greenAccent, Colors.black87, Colors.deepOrange, Colors.blueGrey, Colors.amber, Colors.cyan,
    Colors.teal, Colors.brown,
  ];
  static var pageBackgroundColor = Colors.orange[50];

}

class Routes {
  const Routes();
  String get homepage => 'homepage';
  String get favouritesPage => 'favourites';
  String get questionsPage => 'questions';
  String get newCategory => 'newcategory';
  String get favouriteQuestionPage => 'favouritequestionpage';
  String get mixedModePage => 'mixedmodepage';
  String get categoryManagementPage => 'categorymanagementpage';
  String get categoryListPage => 'categorylistpage';
}


