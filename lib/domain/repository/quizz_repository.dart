import '../../data/model/requests/crossword_submit_request.dart';
import '../../data/model/requests/quizz_submit_request.dart';
import '../../data/model/responses/crossword_questions.dart';
import '../../data/model/responses/leaderboard_top15_response.dart';
import '../../data/model/responses/leaderboard_top5_response.dart';
import '../../data/model/responses/login_response.dart';
import '../../data/model/responses/quizz_questions.dart';

abstract class QuizzRepository {
  Future<LoginResponse> login(int groupId, int journalNumber);

  Future<List<QuizzQuestions>> getQuizzQuestions();
  Future<List<CrosswordQuestions>> getCrosswordQuestions();

  Future<int> getQuizzTimer();
  Future<int> getCrosswordTimer();

  Future<List<LeaderboardTop15Response>> getTop15();
  Future<List<LeaderboardTop5Response>> getTop5();

  Future<bool> submitQuizzAnswer(QuizzSubmitRequest request);
  Future<bool> submitCrosswordAnswer(CrosswordSubmitRequest request);
}

