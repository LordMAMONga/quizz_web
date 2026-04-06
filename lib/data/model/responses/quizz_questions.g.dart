// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizz_questions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizzQuestionsAdapter extends TypeAdapter<QuizzQuestions> {
  @override
  final int typeId = 2;

  @override
  QuizzQuestions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizzQuestions(
      question: fields[0] as String,
      id: fields[3] as int,
      correctAnswer: fields[1] as String,
      incorrectAnswers: (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuizzQuestions obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.correctAnswer)
      ..writeByte(2)
      ..write(obj.incorrectAnswers)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizzQuestionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizzQuestions _$QuizzQuestionsFromJson(Map<String, dynamic> json) =>
    QuizzQuestions(
      question: json['question'] as String,
      id: (json['id'] as num).toInt(),
      correctAnswer: json['correctAnswer'] as String,
      incorrectAnswers: (json['incorrectAnswers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$QuizzQuestionsToJson(QuizzQuestions instance) =>
    <String, dynamic>{
      'question': instance.question,
      'correctAnswer': instance.correctAnswer,
      'incorrectAnswers': instance.incorrectAnswers,
      'id': instance.id,
    };
