import 'package:hive/hive.dart';
import 'package:untitled2/models/local_place.dart';

class Boxes {
  static Box<LocalPlace> getFavoritesBox() => Hive.box<LocalPlace>('favorites');
}
