part of 'quizz_cubit.dart';

class QuizzState {
  final bool isLoading;
  final String? error;
  final List<QuizzQuestions> questions;
  final int currentIndex;
  final bool isFinished;

  QuizzState({
    this.isLoading = false,
    this.error,
    this.questions = const [],
    this.currentIndex = 0,
    this.isFinished = false,
  });

  QuizzState copyWith({
    bool? isLoading,
    String? error,
    List<QuizzQuestions>? questions,
    int? currentIndex,
    bool? isFinished,
  }) {
    return QuizzState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      isFinished: isFinished ?? this.isFinished,
    );
  }
}