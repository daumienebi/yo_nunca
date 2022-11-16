import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:yo_nunca/src/models/category.dart';

class CategoryProvider with ChangeNotifier{

  List<Category> _categories = [];

  Future<List<Category>> getCategories() async{
    //help from https://www.bezkoder.com/dart-flutter-parse-json-string-array-to-object-list/#DartFlutter_parse_JSON_array_into_List
    String categoriesJson = await rootBundle.loadString('assets/db/categories.json');
    var jsonToList = json.decode(categoriesJson)['categories'] as List;
    _categories = jsonToList.map((jsonToList) => Category.fromJson(jsonToList)).toList();
    notifyListeners();
    return _categories;
  }
}