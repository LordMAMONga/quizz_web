import 'package:quizz_web/domain/repository/quizz_repository.dart';

import '../../data/model/responses/leaderboard_top15_response.dart';

class GetTop15UseCase {
  final QuizzRepository repository;

  GetTop15UseCase(this.repository);

  Future<List<LeaderboardTop15Response>> call() async{
    return await repository.getTop15();
  }
}