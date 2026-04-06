import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_top15_use_case.dart';
import '../../../domain/usecases/get_top5_use_case.dart';

part 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  final GetTop15UseCase getTop15UseCase;
  final GetTop5UseCase getTop5UseCase;

  LeaderboardCubit({
    required this.getTop15UseCase,
    required this.getTop5UseCase,
  }) : super(LeaderboardState());

  Future<void> fetchQuizResults() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final list = await getTop15UseCase();
      emit(state.copyWith(isLoading: false, list: list));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> fetchFinalWinners() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final list = await getTop5UseCase();
      emit(state.copyWith(isLoading: false, list: list));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
