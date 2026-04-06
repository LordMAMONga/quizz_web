import 'package:quizz_web/data/model/responses/login_response.dart';
import 'package:quizz_web/domain/repository/quizz_repository.dart';

class LoginUseCase {
  final QuizzRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResponse> call(int groupId, int journalNumber) async {
    return await repository.login(groupId, journalNumber);
  }

}