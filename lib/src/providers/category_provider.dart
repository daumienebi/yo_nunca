import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:yo_nunca/src/models/category.dart';

class CategoryProvider with ChangeNotifier{

  List<Category> _defaultCategories = [];
  List<Category> _categories = []; //the new categories to be added by the user
  List<Category> _allCategories = []; //the new categories to be added by the user

  List<Category> get defaultCategories{
    if(_defaultCategories.isNotEmpty) return _defaultCategories;
    getDefaultCategories();
    return _defaultCategories;
  }

  List<Category> get categories{
    if(_categories.isNotEmpty) return _categories;
    getCategories();
    return _categories;
  }

  //nope
  List<Category> get allCategories{
    getAllCategories();
    return _allCategories;
  }

  Future<List<Category>> getDefaultCategories() async{
    //help from https://www.bezkoder.com/dart-flutter-parse-json-string-array-to-object-list/#DartFlutter_parse_JSON_array_into_List
    String categoriesJson = await rootBundle.loadString('assets/questions/categories.json');//get the data later from the database
    var jsonToList = json.decode(categoriesJson)['categories'] as List;
    _defaultCategories = jsonToList.map((jsonToList) => Category.fromJson(jsonToList)).toList();
    notifyListeners();
    return _defaultCategories;
  }

  ///Returns the list of categories added by the user
  Future<List<Category>> getCategories() async{
    return _categories;
  }

  ///Returns the default categories and the ones added by the user
  Future<List<Category>> getAllCategories() async{
    // nope
    _allCategories.addAll(defaultCategories);
    _allCategories.addAll(categories);
    return _allCategories;
  }

  int categoriesCount() => allCategories.length;

  Future<int> addCategory (Category category) async{
    _categories.add(category);
    notifyListeners();
    return category.id ?? 0;
  }

  Future<int> deleteCategory (Category category) async{
    _categories.remove(category);
    notifyListeners();
    return category.id ?? 0;
  }

}