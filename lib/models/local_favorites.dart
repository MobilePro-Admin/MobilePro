import 'package:hive/hive.dart';

part 'local_favorites.g.dart';

@HiveType(typeId: 0)
class LocalFavorites extends HiveObject{
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? image;

  @HiveField(3)
  String? description;

  @HiveField(4)
  double? rating;
}