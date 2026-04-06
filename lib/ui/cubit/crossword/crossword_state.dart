part of 'crossword_cubit.dart';

class CrosswordState {
  final bool isLoading;
  final String? error;
  final List<CrosswordQuestions> questions;
  final Set<int> solvedIds;

  CrosswordState({
    this.isLoading = false,
    this.error,
    this.questions = const [],
    this.solvedIds = const {},
  });

  CrosswordState copyWith({
    bool? isLoading,
    String? error,
    List<CrosswordQuestions>? questions,
    Set<int>? solvedIds,
  }) {
    return CrosswordState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      questions: questions ?? this.questions,
      solvedIds: solvedIds ?? this.solvedIds,
    );
  }
}