import 'package:quizz_web/domain/repository/quizz_repository.dart';

import '../../data/model/responses/leaderboard_top5_response.dart';

class GetTop5UseCase {
  final QuizzRepository repository;

  GetTop5UseCase(this.repository);

  Future<List<LeaderboardTop5Response>> call() async{
    return await repository.getTop5();
  }
}