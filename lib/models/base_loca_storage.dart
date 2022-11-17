import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled2/models/model_gridview.dart';

abstract class BaseLocalStorage {
  Future<Box> openBox();
  List<ModelGridview> getWishList(Box box);
  Future<void> addPlaceToWishList(Box box, ModelGridview place);
  Future<void> removePlaceFromWishList(Box box, ModelGridview place);
  Future<void> clearWishList(Box box);
}