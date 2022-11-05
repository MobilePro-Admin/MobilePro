
import 'package:flutter/material.dart';
import 'package:untitled2/pages/components/placesModel.dart';
import 'package:untitled2/pages/components/restAPI.dart';

class HomePageStateProvider extends ChangeNotifier
{
  RESTAPI api = RESTAPI();

  Future<List<PlaceModel>> getAllPlaces() async {
    return await api.getAllPlaces();    
  }
}