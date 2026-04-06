import 'package:json_annotation/json_annotation.dart';

part 'crossword_submit_request.g.dart';

@JsonSerializable()
class CrosswordSubmitRequest {
  final int studentId;
  final int wordId;
  final String answer;

  CrosswordSubmitRequest({
    required this.studentId,
    required this.answer,
    required this.wordId
});

  Map<String, dynamic> toJson() => _$CrosswordSubmitRequestToJson(this);
}