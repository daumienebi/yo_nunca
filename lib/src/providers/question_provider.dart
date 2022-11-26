import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:yo_nunca/src/models/question.dart';
import 'package:yo_nunca/src/utils/constants.dart';

class QuestionProvider with ChangeNotifier{

  List<Question> _questions = [];
  List<Question> _normalQuestions = [];
  List<Question> _intermediateQuestions = [];
  List<Question> _hotQuestions = [];
  List<Question> _favouriteQuestions = [];

  //getters
  List<Question> get normalQuestions {
    if(_normalQuestions.isNotEmpty) return _normalQuestions;
    getNormalQuestions();
    return _normalQuestions;
  }

  List<Question> get intermediateQuestions{
    if(_intermediateQuestions.isNotEmpty) return _intermediateQuestions;
    getIntermediateQuestions();
    return _intermediateQuestions;
  }

  List<Question> get hotQuestions{
    if(_hotQuestions.isEmpty){
      getHotQuestions(); return _hotQuestions;
    }
      return _hotQuestions;
  }

  List<Question> get favouriteQuestions {
    if(_favouriteQuestions.isNotEmpty) return _favouriteQuestions;
    return _favouriteQuestions;
  }

  /// Returns all questions for mixed mode
  List<Question> get questions {
    if(_questions.isNotEmpty) return _questions;
    getAllQuestions();
    return _questions;
  }


  Future getNormalQuestions() async{
    String questionsJson = await rootBundle.loadString('assets/questions/normal_questions.json');
    var jsonToList = json.decode(questionsJson) as List;
    _normalQuestions = jsonToList.map((jsonToList) => Question.fromJson(jsonToList)).toList();
    notifyListeners();
    return _normalQuestions;
  }

  Future<List<Question>> getIntermediateQuestions() async{
    String questionsJson = await rootBundle.loadString('assets/questions/intermediate_questions.json');
    var jsonToList = json.decode(questionsJson) as List;
    _intermediateQuestions = jsonToList.map((jsonToList) => Question.fromJson(jsonToList)).toList();
    notifyListeners();
    return _intermediateQuestions;
  }

  Future<List<Question>> getHotQuestions() async{
    String questionsJson = await rootBundle.loadString('assets/questions/hot_questions.json');
    var jsonToList = json.decode(questionsJson) as List;
    _hotQuestions = jsonToList.map((jsonToList) => Question.fromJson(jsonToList)).toList();
    notifyListeners();
    return _hotQuestions;
  }

  Future addToFavourites (Question question) async{
    _favouriteQuestions.add(question);
    notifyListeners();
  }

  //onDismissed method must be void : check it out
  removeFromFavourites (Question question){
    _favouriteQuestions.remove(question);
    notifyListeners();
  }

  ///This method returns the number of questions per Category, the default
  ///categories will be obtained seperately and the rest will be requested from
  ///the DB
  int getNumberOfQuestionsPerCategory(int categoryId){
    int questionsCount;
    switch(categoryId){
      case Constants.normalCategoryId : {
        print("Normal questions: ${_normalQuestions.length}");
        return normalQuestions.length;
      }
      break;
      case Constants.intermediateCategoryId : {
        return intermediateQuestions.length;
      }
      break;
      case Constants.hotCategoryId : {
        return hotQuestions.length;
      }
      break;
      default :
        {
          //Get the rest from the DB
          questionsCount = 0;
          return questionsCount;
        }
    }
  }

  Future<List<Question>> getAllQuestions() async{
    //Add all the questions to the main list then return it
    //Check it out
    _questions.addAll(await getNormalQuestions());
    _questions.addAll(await getIntermediateQuestions());
    _questions.addAll(await getHotQuestions());
    return _questions;
  }
}