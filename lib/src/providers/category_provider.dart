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
    notifyListeners();
  }

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

  /// Checks if a category with the given name already exists
  categoryExists(String categoryName) async{
    bool exists = await _categoryRepository.categoryExists(categoryName);
    return exists;
  }

  ///Fetch the list of all categories
  Future<List<Category>>getCategories() async{
    var dbCategories = await _categoryRepository.getAllCategories();
    _setCategories(dbCategories);
    return dbCategories;
  }

}