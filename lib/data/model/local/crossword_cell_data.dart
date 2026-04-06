import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crossword_cell_data.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class CrosswordCellData {
  @HiveField(0)
  final int row;
  @HiveField(1)
  final int column;
  @HiveField(2)
  final int letter;

  CrosswordCellData({
    required this.column,
    required this.letter,
    required this.row,
  });
}
