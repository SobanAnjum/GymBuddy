import 'package:hive/hive.dart';

part 'excercise.g.dart';

@HiveType(typeId:1)
class Excercise {

  @HiveField(0)
  String name;

  @HiveField(1)
  String muscle;

  @HiveField(2)
  String description;

  @HiveField(3)
  bool selected;
Excercise({required this.name, required this.muscle, required this.description, this.selected = false});
}