import 'dart:math';

import 'package:flutter/material.dart';

class ViewDetails extends StatefulWidget {
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
  int numberPackage = 0;

  removePackage() {
    setState(() {
      numberPackage--;
      numberPackage = max(numberPackage, 0);
    });
  }

  addPackage() {
    setState(() {
      numberPackage++;
      numberPackage = min(numberPackage, 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData appTheme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.menu),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: size.height * 0.7,
              color: Colors.grey,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: 26, left: 20, right: 20),
                height: size.height * 0.54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Amazonas", style: appTheme.textTheme.headline2),
                    SizedBox(height: 4),
                    Row(children: [
                      Icon(
                        Icons.location_pin,
                        size: 14,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Extremo sur de Colombia",
                        style: appTheme.textTheme.caption,
                      )
                    ]),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Description",
                      style: appTheme.textTheme.headline3
                          .merge(TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Su capital es Leticia. Está ubicado en el extremo sur del país, en gran parte al sur de la línea ecuatorial, en la región Amazonia.",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyText1,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Se compone en su totalidad de territorio de la Selva Amazónica. La porción meridional del departamento, al sur del río Putumayo, se denomina `Trapecio amazónico`, el cual incluye la triple frontera de Colombia, Perú y Brasil, y su límite sur es el río Amazonas.",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Hidrografía",
                      style: appTheme.textTheme.headline3
                          .merge(TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Además del Amazonas, otros ríos del departamento son:",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyText1,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "+ Río Caquetá: el principal tributario del Amazonas.",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyText1,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "+ Río Putumayo: que marca el límite con Perú.",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyText1,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "+ Río Apaporis: que marca el límite septentrional con el departamento del Vaupés.",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Parques naturales",
                      style: appTheme.textTheme.headline3
                          .merge(TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "El departamento, dada su gran riqueza ecológica y medio ambiental, es sede de varios parques naturales nacionales colombianos:",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyText1,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "+ Parque nacional natural Amacayacu.",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyText1,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "+ Parque nacional natural Cahuinarí.",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyText1,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "+ Parque nacional natural Río Puré.",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyText1,
                    ),
                    SizedBox(height: 12),
                    Text(
                      "+ Parque nacional natural Yaigojé Apaporis.",
                      maxLines: 4,
                      overflow: TextOverflow.fade,
                      style: appTheme.textTheme.bodyText1,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
