import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled2/boxes.dart';
import 'package:untitled2/models/local_favorites.dart';
import 'package:untitled2/models/model_gridview.dart';
import 'package:untitled2/pages/components/rating.dart';

void _onFavoriteButtonClicked(ModelGridview locationData) async {
  var localFavorite = LocalFavorites()
    ..id = locationData.id
    ..name = locationData.name
    ..image = locationData.image
    ..description = locationData.description
    ..rating = locationData.rating;

  final box = Boxes.getFavoritesBox();
  box.add(localFavorite);
}

Widget travelCard(ModelGridview locationData) => Stack(
      children: [
        SizedBox(
          height: double.maxFinite,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: AssetImage(locationData.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: 12,
            icon: const Icon(
              Icons.favorite_border,
              size: 20,
              color: Colors.red,
            ),
            onPressed: () {
              _onFavoriteButtonClicked(locationData);
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withAlpha(90)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locationData.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Row(
                  children: [rating(rating: locationData.rating)],
                )
              ],
            ),
          ),
        )
      ],
    );
