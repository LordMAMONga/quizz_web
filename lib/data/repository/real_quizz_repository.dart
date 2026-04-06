import 'package:dio/dio.dart';
import '../../domain/repository/quizz_repository.dart';
import '../datasource/hive_service.dart';
import '../model/requests/quizz_submit_request.dart';
import '../model/responses/login_response.dart';
import '../model/responses/quizz_questions.dart';
import '../model/responses/crossword_questions.dart';
import '../model/responses/leaderboard_top15_response.dart';
import '../model/responses/leaderboard_top5_response.dart';
import '../model/requests/crossword_submit_request.dart';

class RealQuizzRepository implements QuizzRepository {
  final Dio dio;
  final HiveService hiveService;

  RealQuizzRepository({required this.dio, required this.hiveService});

  @override
  Future<LoginResponse> login(int groupId, int journalNumber) async {
    final response = await dio.get(
      '/api/students/login',
      queryParameters: {
        'groupId': groupId,
        'journalNumber': journalNumber,
      },
    );

    final user = LoginResponse.fromJson(response.data);

    await hiveService.saveUser(user);

    return user;
  }

  @override
  Future<List<QuizzQuestions>> getQuizzQuestions() async {
    final response = await dio.get('/api/quiz/questions');
    final questions = (response.data as List)
        .map((e) => QuizzQuestions.fromJson(e))
        .toList();

    await hiveService.saveQuizQuestions(questions);

    return questions;
  }

  @override
  Future<List<CrosswordQuestions>> getCrosswordQuestions() async {
    final response = await dio.get('/api/crossword/questions');
    final questions = (response.data as List)
        .map((e) => CrosswordQuestions.fromJson(e))
        .toList();

    await hiveService.saveCrosswordQuestions(questions);

    return questions;
  }

  @override
  Future<int> getQuizzTimer() async {
    final response = await dio.get('/api/students/timer');
    return int.parse(response.data.toString());
  }

  @override
  Future<int> getCrosswordTimer() async {
    final response = await dio.get('/api/students/timer/crossword');
    return int.parse(response.data.toString());
  }

  @override
  Future<List<LeaderboardTop15Response>> getTop15() async {
    final response = await dio.get('/api/students/leaderboard');
    return (response.data as List)
        .map((e) => LeaderboardTop15Response.fromJson(e))
        .toList();
  }

  @override
  Future<List<LeaderboardTop5Response>> getTop5() async {
    final response = await dio.get('/api/students/leaderboard/crossword');
    return (response.data as List)
        .map((e) => LeaderboardTop5Response.fromJson(e))
        .toList();
  }

  @override
  Future<bool> submitQuizzAnswer(QuizzSubmitRequest request) async {
    final response = await dio.post(
        '/api/quiz/submit',
        data: request.toJson()
    );
    return response.data as bool;
  }

  @override
  Future<bool> submitCrosswordAnswer(CrosswordSubmitRequest request) async {
    final response = await dio.post(
        '/api/crossword/submit',
        data: request.toJson()
    );
    return response.data as bool;
  }
}