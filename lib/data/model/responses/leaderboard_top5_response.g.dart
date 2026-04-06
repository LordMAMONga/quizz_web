// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_top5_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderboardTop5Response _$LeaderboardTop5ResponseFromJson(
        Map<String, dynamic> json) =>
    LeaderboardTop5Response(
      id: (json['id'] as num).toInt(),
      top5: json['top5'] as bool,
      crosswordFinishedAt: json['crosswordFinishedAt'] == null
          ? null
          : DateTime.parse(json['crosswordFinishedAt'] as String),
      name: json['name'] as String,
      crosswordScore: (json['crosswordScore'] as num).toInt(),
      quizFinishedAt: json['quizFinishedAt'] == null
          ? null
          : DateTime.parse(json['quizFinishedAt'] as String),
      quizScore: (json['quizScore'] as num).toInt(),
      registered: json['registered'] as bool,
      totalScore: (json['totalScore'] as num).toInt(),
      top15: json['top15'] as bool,
      groupId: (json['groupId'] as num).toInt(),
      journalNumber: (json['journalNumber'] as num).toInt(),
    );

Map<String, dynamic> _$LeaderboardTop5ResponseToJson(
        LeaderboardTop5Response instance) =>
    <String, dynamic>{
      'name': instance.name,
      'groupId': instance.groupId,
      'journalNumber': instance.journalNumber,
      'crosswordFinishedAt': instance.crosswordFinishedAt?.toIso8601String(),
      'crosswordScore': instance.crosswordScore,
      'id': instance.id,
      'quizFinishedAt': instance.quizFinishedAt?.toIso8601String(),
      'quizScore': instance.quizScore,
      'registered': instance.registered,
      'top15': instance.top15,
      'top5': instance.top5,
      'totalScore': instance.totalScore,
    };
