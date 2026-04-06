import 'package:quizz_web/domain/repository/quizz_repository.dart';

class GetQuizTimerUseCase {
  final QuizzRepository repository;

  GetQuizTimerUseCase(this.repository);

  Future<int> call() async{
    return await repository.getQuizzTimer();
  }
}