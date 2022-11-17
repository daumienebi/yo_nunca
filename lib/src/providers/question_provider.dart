import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:yo_nunca/src/models/question.dart';

class QuestionProvider with ChangeNotifier{

  List<Question> _questions = [];
  List<Question> _normalQuestions = [];
  List<Question> _intermediateQuestions = [];
  List<Question> _hotQuestions = [];

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
  Future getNormalQuestions() async{
    String questionsJson = await rootBundle.loadString('assets/db/normal_questions.json');
    var jsonToList = json.decode(questionsJson) as List;
    _normalQuestions = jsonToList.map((jsonToList) => Question.fromJson(jsonToList)).toList();
    notifyListeners();
    return _normalQuestions;
  }

  Future<List<Question>> getIntermediateQuestions() async{
    String questionsJson = await rootBundle.loadString('assets/db/intermediate_questions.json');
    var jsonToList = json.decode(questionsJson) as List;
    _intermediateQuestions = jsonToList.map((jsonToList) => Question.fromJson(jsonToList)).toList();
    notifyListeners();
    return _intermediateQuestions;
  }

  Future<List<Question>> getHotQuestions() async{
    String questionsJson = await rootBundle.loadString('assets/db/hot_questions.json');
    var jsonToList = json.decode(questionsJson) as List;
    _hotQuestions = jsonToList.map((jsonToList) => Question.fromJson(jsonToList)).toList();
    notifyListeners();
    return _hotQuestions;
  }

  Future<List<Question>> getAllQuestions() async{
    //Add all the questions to the main list then return it
    _questions.addAll(await getNormalQuestions());
    _questions.addAll(await getIntermediateQuestions());
    _questions.addAll(await getHotQuestions());
    return _questions;
  }
}