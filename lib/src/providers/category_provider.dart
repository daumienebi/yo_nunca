import 'dart:developer' as dev;
import 'package:flutter/cupertino.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/repository/category_repository.dart';

class CategoryProvider with ChangeNotifier{
  //Obtain an instance of the Repository
  final _categoryRepository = CategoryRepository();

  List<Category> _categories = [];
  List<Category> _defaultCategories = [];
  List<Category> _newCategories = [];

  List<Category> get categories{
    getCategories();
    return _categories;
  }

  List<Category> get defaultCategories {
    getDefaultCategories();
    return _defaultCategories;
  }

  List<Category> get newCategories {
    getNewCategories();
    return _newCategories;
  }

  _setCategories(List<Category> dbCategories){
    _categories = dbCategories;
    //dev.log('${_categories.length} categories in setCategories');
    notifyListeners();
  }
  int categoriesCount() => categories.length;

  //From DB
  addCategory (Category category) async{
    final id = await _categoryRepository.addCategory(category);
    notifyListeners();
    return id;
  }

  deleteCategory (Category category) async{
    final id = await _categoryRepository.deleteCategory(category);
    notifyListeners();
    return id;
  }

  modifyCategory (Category category) async{
    final id = await _categoryRepository.modifyCategory(category);
    notifyListeners();
    return id;
  }

  //Return the default categories
  List<Category> get defaultQuestion {
    getDefaultCategories();
    notifyListeners();
    return _defaultCategories;
  }

  getDefaultCategories() async{
    var defaultCategories = await _categoryRepository.getDefaultCategories();
    _defaultCategories = defaultCategories;
    notifyListeners();
  }

  getNewCategories() async{
    var newCategories = await _categoryRepository.getNewCategories();
    _newCategories = newCategories;
    notifyListeners();
  }

  ///Returns the list of categories added by the user
  void getCategories() async{
    var dbCategories = await _categoryRepository.getAllCategories();
    _setCategories(dbCategories);
    //dev.log('${_categories.length} categories in getCategories');
  }

}