import 'package:hive/hive.dart';
import 'package:untitled2/models/base_loca_storage.dart';
import 'package:untitled2/models/model_gridview.dart';

class LocalStorage extends BaseLocalStorage {
  String boxName = "wishlist_places";

  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<ModelGridview>(boxName);
    return box;
  }

  @override
  List getWishList(Box box) {
    return box.values.toList() as List<ModelGridview>;
  }

  @override
  Future<void> addPlaceToWishList(Box box, ModelGridview place) async {
    await box.put(place.id, place);
  }

  @override
  Future<void> removePlaceFromWishList(Box box, ModelGridview place) async {
    await box.delete(place.id);
  }

  @override
  Future<void> clearWishList(Box box) async {
    await box.clear();
  }

}