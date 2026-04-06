// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crossword_submit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrosswordSubmitRequest _$CrosswordSubmitRequestFromJson(
        Map<String, dynamic> json) =>
    CrosswordSubmitRequest(
      studentId: (json['studentId'] as num).toInt(),
      answer: json['answer'] as String,
      wordId: (json['wordId'] as num).toInt(),
    );

Map<String, dynamic> _$CrosswordSubmitRequestToJson(
        CrosswordSubmitRequest instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'wordId': instance.wordId,
      'answer': instance.answer,
    };
