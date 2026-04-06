import 'package:quizz_web/data/model/requests/quizz_submit_request.dart';
import 'package:quizz_web/domain/repository/quizz_repository.dart';

class SubmitQuizAnswerUseCase {
  final QuizzRepository repository;

  SubmitQuizAnswerUseCase(this.repository);

  Future<bool> call(QuizzSubmitRequest request) async{
    return await repository.submitQuizzAnswer(request);
  }
}