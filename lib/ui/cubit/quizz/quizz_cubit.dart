import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/requests/quizz_submit_request.dart';
import '../../../domain/usecases/get_quiz_questions_use_case.dart';
import '../../../domain/usecases/submit_quiz_answer_use_case.dart';
import '../../../data/model/responses/quizz_questions.dart';

part 'quizz_state.dart';

class QuizzCubit extends Cubit<QuizzState> {
  final GetQuizQuestionsUseCase getQuestionsUseCase;
  final SubmitQuizAnswerUseCase submitAnswerUseCase;

  QuizzCubit({
    required this.getQuestionsUseCase,
    required this.submitAnswerUseCase,
  }) : super(QuizzState());

  Future<void> loadQuestions() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final questions = await getQuestionsUseCase();
      emit(state.copyWith(isLoading: false, questions: questions));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> selectAnswer(int studentId, String answer) async {
    try {
      final currentQuestion = state.questions[state.currentIndex];

      await submitAnswerUseCase(QuizzSubmitRequest(
        studentId: studentId,
        questionId: currentQuestion.id,
        answer: answer,
      ));

      if (state.currentIndex < state.questions.length - 1) {
        emit(state.copyWith(currentIndex: state.currentIndex + 1));
      } else {
        emit(state.copyWith(isFinished: true));
      }
    } catch (e) {
      emit(state.copyWith(error: "Не удалось отправить ответ"));
    }
  }
}