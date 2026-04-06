import 'package:json_annotation/json_annotation.dart';

part 'leaderboard_top15_response.g.dart';

@JsonSerializable()
class LeaderboardTop15Response {
  final String name;
  final int groupId;
  final int journalNumber;
  final DateTime? crosswordFinishedAt;
  final int crosswordScore;
  final int id;
  final DateTime? quizFinishedAt;
  final int quizScore;
  final bool registered;
  final bool top15;
  final bool top5;
  final int totalScore;

  LeaderboardTop15Response({
    required this.id,
    required this.top5,
    required this.crosswordFinishedAt,
    required this.name,
    required this.crosswordScore,
    required this.quizFinishedAt,
    required this.quizScore,
    required this.registered,
    required this.totalScore,
    required this.top15,
    required this.groupId,
    required this.journalNumber,
  });

  factory LeaderboardTop15Response.fromJson(Map<String,dynamic> json) => _$LeaderboardTop15ResponseFromJson(json);

  Map<String,dynamic> toJson() => _$LeaderboardTop15ResponseToJson(this);
}
