import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_quiz_timer_use_case.dart';

part 'waiting_state.dart';

class WaitingCubit extends Cubit<WaitingState> {
  final GetQuizTimerUseCase getTimerUseCase;
  Timer? _timer;

  WaitingCubit({required this.getTimerUseCase}) : super(WaitingState());

  void startPolling() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      try {
        final remainingSeconds = await getTimerUseCase();

        if (remainingSeconds > 0) {
          emit(state.copyWith(seconds: remainingSeconds, isStarted: true));
        } else {
          emit(state.copyWith(seconds: 0, isStarted: false));
        }
      } catch (e) {
// пофиг
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}