import 'dart:core';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crossword_questions.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class CrosswordQuestions {
  @HiveField(0)
  final String question;
  @HiveField(1)
  final String correctAnswer;
  @HiveField(2)
  final int pointValue;
  @HiveField(3)
  final int id;

  CrosswordQuestions({
    required this.correctAnswer,
    required this.id,
    required this.question,
    required this.pointValue,
  });

  String get answer => correctAnswer;

  factory CrosswordQuestions.fromJson(Map<String,dynamic> json) => _$CrosswordQuestionsFromJson(json);
  Map<String,dynamic> toJson() => _$CrosswordQuestionsToJson(this);

}
