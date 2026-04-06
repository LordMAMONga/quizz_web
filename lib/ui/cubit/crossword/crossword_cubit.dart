import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_crossword_questions_use_case.dart';
import '../../../domain/usecases/submit_crossword_answer_use_case.dart';
import '../../../data/model/responses/crossword_questions.dart';
import '../../../data/model/requests/crossword_submit_request.dart';

part 'crossword_state.dart';

class CrosswordCubit extends Cubit<CrosswordState> {
  final GetCrosswordQuestionsUseCase getQuestionsUseCase;
  final SubmitCrosswordAnswerUseCase submitAnswerUseCase;

  CrosswordCubit({
    required this.getQuestionsUseCase,
    required this.submitAnswerUseCase,
  }) : super(CrosswordState());

  Future<void> initCrossword() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final questions = await getQuestionsUseCase();
      emit(state.copyWith(isLoading: false, questions: questions));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> checkWord(int studentId, int wordId, String answer) async {
    try {
      final isCorrect = await submitAnswerUseCase(CrosswordSubmitRequest(
        studentId: studentId,
        wordId: wordId,
        answer: answer,
      ));

      if (isCorrect) {
        final updatedSolved = Set<int>.from(state.solvedIds)..add(wordId);
        emit(state.copyWith(solvedIds: updatedSolved));
      }
    } catch (e) {
//xd
    }
  }
}