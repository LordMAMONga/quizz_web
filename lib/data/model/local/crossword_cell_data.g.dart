// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crossword_cell_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CrosswordCellDataAdapter extends TypeAdapter<CrosswordCellData> {
  @override
  final int typeId = 2;

  @override
  CrosswordCellData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CrosswordCellData(
      column: fields[1] as int,
      letter: fields[2] as int,
      row: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CrosswordCellData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.row)
      ..writeByte(1)
      ..write(obj.column)
      ..writeByte(2)
      ..write(obj.letter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CrosswordCellDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrosswordCellData _$CrosswordCellDataFromJson(Map<String, dynamic> json) =>
    CrosswordCellData(
      column: (json['column'] as num).toInt(),
      letter: (json['letter'] as num).toInt(),
      row: (json['row'] as num).toInt(),
    );

Map<String, dynamic> _$CrosswordCellDataToJson(CrosswordCellData instance) =>
    <String, dynamic>{
      'row': instance.row,
      'column': instance.column,
      'letter': instance.letter,
    };
