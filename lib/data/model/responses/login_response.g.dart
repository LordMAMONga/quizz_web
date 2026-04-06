// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginResponseAdapter extends TypeAdapter<LoginResponse> {
  @override
  final int typeId = 1;

  @override
  LoginResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginResponse(
      journalNumber: fields[2] as int,
      groupId: fields[1] as int,
      top15: fields[9] as bool,
      totalScore: fields[11] as int,
      registered: fields[8] as bool,
      quizScore: fields[7] as int,
      quizFinishedAt: fields[6] as DateTime?,
      crosswordScore: fields[4] as int,
      name: fields[0] as String,
      id: fields[5] as int,
      crosswordFinishedAt: fields[3] as DateTime?,
      top5: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LoginResponse obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.groupId)
      ..writeByte(2)
      ..write(obj.journalNumber)
      ..writeByte(3)
      ..write(obj.crosswordFinishedAt)
      ..writeByte(4)
      ..write(obj.crosswordScore)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.quizFinishedAt)
      ..writeByte(7)
      ..write(obj.quizScore)
      ..writeByte(8)
      ..write(obj.registered)
      ..writeByte(9)
      ..write(obj.top15)
      ..writeByte(10)
      ..write(obj.top5)
      ..writeByte(11)
      ..write(obj.totalScore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      journalNumber: (json['journalNumber'] as num).toInt(),
      groupId: (json['groupId'] as num).toInt(),
      top15: json['top15'] as bool,
      totalScore: (json['totalScore'] as num).toInt(),
      registered: json['registered'] as bool,
      quizScore: (json['quizScore'] as num).toInt(),
      quizFinishedAt: json['quizFinishedAt'] == null
          ? null
          : DateTime.parse(json['quizFinishedAt'] as String),
      crosswordScore: (json['crosswordScore'] as num).toInt(),
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      crosswordFinishedAt: json['crosswordFinishedAt'] == null
          ? null
          : DateTime.parse(json['crosswordFinishedAt'] as String),
      top5: json['top5'] as bool,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
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
