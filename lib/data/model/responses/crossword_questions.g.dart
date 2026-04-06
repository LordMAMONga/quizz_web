// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crossword_questions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CrosswordQuestionsAdapter extends TypeAdapter<CrosswordQuestions> {
  @override
  final int typeId = 3;

  @override
  CrosswordQuestions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CrosswordQuestions(
      correctAnswer: fields[1] as String,
      id: fields[3] as int,
      question: fields[0] as String,
      pointValue: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CrosswordQuestions obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.correctAnswer)
      ..writeByte(2)
      ..write(obj.pointValue)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CrosswordQuestionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrosswordQuestions _$CrosswordQuestionsFromJson(Map<String, dynamic> json) =>
    CrosswordQuestions(
      correctAnswer: json['correctAnswer'] as String,
      id: (json['id'] as num).toInt(),
      question: json['question'] as String,
      pointValue: (json['pointValue'] as num).toInt(),
    );

Map<String, dynamic> _$CrosswordQuestionsToJson(CrosswordQuestions instance) =>
    <String, dynamic>{
      'question': instance.question,
      'correctAnswer': instance.correctAnswer,
      'pointValue': instance.pointValue,
      'id': instance.id,
    };
