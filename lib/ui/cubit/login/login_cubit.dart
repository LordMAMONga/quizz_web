import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/login_use_case.dart';
import '../../../data/model/responses/login_response.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginState());

  Future<void> signIn(int groupId, int journalNumber) async {
    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));
    try {
      final user = await loginUseCase(groupId, journalNumber);
      emit(state.copyWith(isLoading: false, isSuccess: true, user: user));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}