part of 'login_cubit.dart';

class LoginState {
  final bool isLoading;
  final String? error;
  final bool isSuccess;
  final LoginResponse? user;

  LoginState({
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
    this.user,
  });

  LoginState copyWith({
    bool? isLoading,
    String? error,
    bool? isSuccess,
    LoginResponse? user,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isSuccess: isSuccess ?? this.isSuccess,
      user: user ?? this.user,
    );
  }
}