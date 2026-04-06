import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class LoginResponse {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int groupId;
  @HiveField(2)
  final int journalNumber;
  @HiveField(3)
  final DateTime? crosswordFinishedAt;
  @HiveField(4)
  final int crosswordScore;
  @HiveField(5)
  final int id;
  @HiveField(6)
  final DateTime? quizFinishedAt;
  @HiveField(7)
  final int quizScore;
  @HiveField(8)
  final bool registered;
  @HiveField(9)
  final bool top15;
  @HiveField(10)
  final bool top5;
  @HiveField(11)
  final int totalScore;

  LoginResponse({
    required this.journalNumber,
    required this.groupId,
    required this.top15,
    required this.totalScore,
    required this.registered,
    required this.quizScore,
    required this.quizFinishedAt,
    required this.crosswordScore,
    required this.name,
    required this.id,
    required this.crosswordFinishedAt,
    required this.top5,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
