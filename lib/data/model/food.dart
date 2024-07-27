import 'package:hive/hive.dart';

part 'food.g.dart';

@HiveType(typeId: 0)
class Food {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? category;

  @HiveField(3)
  String? image;

  Food({this.title, this.description, this.category, this.image});
}
