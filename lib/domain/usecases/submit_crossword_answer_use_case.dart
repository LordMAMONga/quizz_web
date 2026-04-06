import 'package:quizz_web/data/model/requests/crossword_submit_request.dart';
import 'package:quizz_web/domain/repository/quizz_repository.dart';

class SubmitCrosswordAnswerUseCase {
  final QuizzRepository repository;

  SubmitCrosswordAnswerUseCase(this.repository);

  Future<bool> call(CrosswordSubmitRequest request) async{
    return await repository.submitCrosswordAnswer(request);
  }
}