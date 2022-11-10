import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled2/pages/components/placesModel.dart';
import 'package:untitled2/pages/components/rating.dart';

Widget locationDetails(args) => Stack(
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          args.placeTitle,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: double.maxFinite,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: AssetImage(args.imgUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
          height: 60,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  rating(rating: args.rating, color: Colors.black)
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          args.description,
          maxLines: 4,
          overflow: TextOverflow.fade,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
              fontSize: 15,
              fontFamily: 'Roboto',
              height: 1.4
          ),
        ),
    ]),
  ],
);
