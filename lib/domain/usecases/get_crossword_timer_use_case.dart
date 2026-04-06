import 'package:quizz_web/domain/repository/quizz_repository.dart';

class GetCrosswordTimerUseCase {
  final QuizzRepository repository;

  GetCrosswordTimerUseCase(this.repository);

  Future<int> call() async{
    return await repository.getCrosswordTimer();
  }
}