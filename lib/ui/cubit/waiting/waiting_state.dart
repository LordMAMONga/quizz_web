part of 'waiting_cubit.dart';

class WaitingState {
  final bool isLoading;
  final String? error;
  final int seconds;
  final bool isStarted;

  WaitingState({
    this.isLoading = false,
    this.error,
    this.seconds = 0,
    this.isStarted = false,
  });

  WaitingState copyWith({
    bool? isLoading,
    String? error,
    int? seconds,
    bool? isStarted,
  }) {
    return WaitingState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      seconds: seconds ?? this.seconds,
      isStarted: isStarted ?? this.isStarted,
    );
  }
}