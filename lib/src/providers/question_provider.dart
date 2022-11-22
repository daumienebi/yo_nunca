import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:yo_nunca/src/models/question.dart';

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

  Future<List<Question>> getAllQuestions() async{
    //Add all the questions to the main list then return it
    _questions.addAll(await getNormalQuestions());
    _questions.addAll(await getIntermediateQuestions());
    _questions.addAll(await getHotQuestions());
    return _questions;
  }
}