import 'package:quizz_web/data/model/responses/crossword_questions.dart';
import 'package:quizz_web/domain/repository/quizz_repository.dart';

class GetCrosswordQuestionsUseCase {
  final QuizzRepository repository;

  GetCrosswordQuestionsUseCase(this.repository);

  Future<List<CrosswordQuestions>> call() async{
    return await repository.getCrosswordQuestions();
  }
}