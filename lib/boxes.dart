import 'package:hive/hive.dart';
import 'package:untitled2/models/local_favorites.dart';

class Boxes {
  static Box<LocalFavorites> getFavoritesBox() => Hive.box<LocalFavorites>('favorites');
}