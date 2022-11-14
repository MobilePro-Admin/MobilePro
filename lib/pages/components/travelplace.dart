import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled2/pages/components/placesModel.dart';
import 'package:untitled2/pages/components/rating.dart';

Widget travelCard(PlaceModel locationData) => Stack(
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
              Icons.favorite_rounded,
              size: 20,
              color: Colors.red,
            ),
            onPressed: () {})),
    Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.black.withAlpha(90)),
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
              children: [
               rating(rating: locationData.rating)
              ],
            )
          ],
        ),
      ),
    )
  ],
);
