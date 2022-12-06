import 'package:flutter/cupertino.dart';
import 'package:yo_nunca/src/models/category.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/repository/category_repository.dart';
import 'package:yo_nunca/src/repository/question_repository.dart';
import 'dart:developer' as dev;

class QuestionProvider with ChangeNotifier{

  final _questionRepository = QuestionRepository();
  final _categoryRepository = CategoryRepository();

  List<Question> _questions = [];
  List<Question> _favouriteQuestions = [];

  //getters
  List<Question> get favouriteQuestions {
    //notifyListeners();
    return _favouriteQuestions;
  }

  /// Returns all questions for mixed mode
  List<Question> get questions {
    return _questions;
  }

  addQuestion(Question question) async{
    final id = await _questionRepository.addQuestion(question);
    notifyListeners();
    return id;
  }

  addQuestions(List<Question> questions) async{
    final count = await _questionRepository.addQuestions(questions);
    notifyListeners();
    return count;
  }

  deleteQuestion(Question question) async{
    final id = await _questionRepository.deleteQuestion(question);
    //notifyListeners();
    return id;
  }

  modifyQuestion(Question question) async{
    final id = await _questionRepository.modifyQuestion(question);
    notifyListeners();
    return id;
  }

  addToFavourites (Question question) async{
    await _questionRepository.addToFavourites(question);
    //notifyListeners();
  }

  removeFromFavourites (Question question) async{
    await _questionRepository.removeFromFavourites(question);
    notifyListeners();
  }

  countQuestionsPerCategory(int categoryId) async{
    return await _questionRepository.countQuestionsPerCategory(categoryId);
  }

  getQuestionsPerCategory(int categoryId) async{
    return await _questionRepository.getQuestionsPerCategory(categoryId);
  }

  getCategory(int categoryId) async{
    return await _categoryRepository.getCategory(categoryId);
    //dev.log(category.toString());
    //notifyListeners();
  }

  getFavouriteQuestions() async{
    var favouriteQuestions =  await _questionRepository.getFavouriteQuestions();
    _favouriteQuestions = favouriteQuestions;
    //notifyListeners();
  }

  getAllQuestions() async{
    final questions =  await _questionRepository.getAllQuestions();
    _questions = questions;
    //notifyListeners(); unnecessary rebuilds for the widget
  }
}