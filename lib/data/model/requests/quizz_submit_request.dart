import 'package:json_annotation/json_annotation.dart';

part 'quizz_submit_request.g.dart';

@JsonSerializable()
class QuizzSubmitRequest {
  final int studentId;
  final int questionId;
  final String answer;

  QuizzSubmitRequest({
    required this.answer,
    required this.questionId,
    required this.studentId
});

  Map<String, dynamic> toJson() => _$QuizzSubmitRequestToJson(this);
}