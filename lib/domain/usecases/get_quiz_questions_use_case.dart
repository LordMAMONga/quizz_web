import 'package:quizz_web/data/model/responses/quizz_questions.dart';
import 'package:quizz_web/domain/repository/quizz_repository.dart';

class GetQuizQuestionsUseCase {
  final QuizzRepository repository;

  GetQuizQuestionsUseCase(this.repository);

  Future<List<QuizzQuestions>> call() async{
    return await repository.getQuizzQuestions();
  }
}