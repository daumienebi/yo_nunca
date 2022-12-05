import 'package:yo_nunca/src/dao/question_dao.dart';
import 'package:yo_nunca/src/models/question.dart';

class QuestionRepository {
  final questionDao = QuestionDao();

  addQuestion(Question question) => questionDao.addQuestion(question);

  deleteQuestion(Question question) => questionDao.deleteQuestion(question);

  modifyQuestion(Question question) => questionDao.modifyQuestion(question);

  getAllQuestions()  =>  questionDao.getAllQuestions();

  getFavouriteQuestions() => questionDao.getFavouriteQuestions();

  getQuestionsPerCategory(int categoryId) => questionDao.getQuestionsPerCategory(categoryId);

  countQuestionsPerCategory(int categoryId) => questionDao.countQuestionsPerCategory(categoryId);

  addToFavourites(Question question) => questionDao.addToFavourites(question);

  removeFromFavourites(Question question) => questionDao.removeFromFavourites(question);
}
