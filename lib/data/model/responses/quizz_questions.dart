import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quizz_questions.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class QuizzQuestions {
  @HiveField(0)
  final String question;
  @HiveField(1)
  final String correctAnswer;
  @HiveField(2)
  final List<String> incorrectAnswers;
  @HiveField(3)
  final int id;

  QuizzQuestions({
    required this.question,
    required this.id,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory QuizzQuestions.fromJson(Map<String, dynamic> json) => _$QuizzQuestionsFromJson(json);

  List<String> get shuffledAnswers {
    final allAnswers = [correctAnswer, ...incorrectAnswers];
    allAnswers.shuffle();
    return allAnswers;
  }
}
