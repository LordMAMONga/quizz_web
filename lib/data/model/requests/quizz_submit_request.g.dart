// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizz_submit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizzSubmitRequest _$QuizzSubmitRequestFromJson(Map<String, dynamic> json) =>
    QuizzSubmitRequest(
      answer: json['answer'] as String,
      questionId: (json['questionId'] as num).toInt(),
      studentId: (json['studentId'] as num).toInt(),
    );

Map<String, dynamic> _$QuizzSubmitRequestToJson(QuizzSubmitRequest instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'questionId': instance.questionId,
      'answer': instance.answer,
    };
