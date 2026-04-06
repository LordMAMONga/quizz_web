part of 'leaderboard_cubit.dart';

class LeaderboardState {
  final bool isLoading;
  final String? error;
  final List<dynamic> list;

  LeaderboardState({this.isLoading = false, this.error, this.list = const []});

  LeaderboardState copyWith({
    bool? isLoading,
    String? error,
    List<dynamic>? list,
  }) {
    return LeaderboardState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      list: list ?? this.list,
    );
  }
}
