import 'dart:async';

import 'package:hive/hive.dart';
import 'package:quizz_web/data/model/responses/login_response.dart';

import '../model/responses/crossword_questions.dart';
import '../model/responses/quizz_questions.dart';

class HiveService {
  static const String _playerBox = 'playerBox';
  static const String _crosswordBox = 'crosswordBox';
  static const String _quizzBox = 'quizzBox';

  static const String _userKey = 'currentUser';
  static const String _questionsKey = 'quizQuestions';
  static const String _crosswordQuestionsKey = 'crosswordQuestions';

  Future<void> saveUser(LoginResponse user) async{
    var box = Hive.box<LoginResponse>(_playerBox);
    return await box.put(_userKey, user);
  }

  LoginResponse? getUser(){
    var box = Hive.box<LoginResponse>(_playerBox);
    return box.get(_userKey);
  }

  int? getPlayerId() {
    return getUser()?.id;
  }

  Future<void> saveQuizQuestions(List<QuizzQuestions> questions) async {
    var box = Hive.box(_quizzBox);
    return await box.put(_questionsKey, questions);
  }

  List<QuizzQuestions> getQuizQuestions() {
    var box = Hive.box(_quizzBox);
    final List? data = box.get(_questionsKey);
    return data?.cast<QuizzQuestions>() ?? [];
  }

  Future<void> saveCrosswordQuestions(List<CrosswordQuestions> questions) async {
    var box = Hive.box(_crosswordBox);
    return await box.put(_crosswordQuestionsKey, questions);
  }

  List<CrosswordQuestions> getCrosswordQuestions() {
    var box = Hive.box(_crosswordBox);
    final List? data = box.get(_crosswordQuestionsKey);
    return data?.cast<CrosswordQuestions>() ?? [];
  }

  Future<void> clearAll() async {
    await Hive.box<LoginResponse>(_playerBox).clear();
    await Hive.box(_quizzBox).clear();
    await Hive.box(_crosswordBox).clear();
  }
}