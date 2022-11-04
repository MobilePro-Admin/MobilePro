//import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled2/pages/photo_pages.dart';
import 'package:untitled2/pages/shop_page.dart';
import 'package:untitled2/services/firebase_services.dart';
import 'login_page.dart';
import 'maps_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData appTheme = Theme.of(context);
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.modulate)),
        ),
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.5),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 16),
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: size.height * 0.25,
                              child: Image(
                                image: AssetImage('assets/images/amazonas.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                                child: Container(
                              padding:
                                  EdgeInsets.only(top: 26, left: 20, right: 20),
                              height: size.height * 0.55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.white),
                              child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Amazonas",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 26,
                                          )),
                                      SizedBox(height: 4),
                                      Row(children: [
                                        Icon(
                                          Icons.location_pin,
                                          size: 14,
                                        ),
                                        SizedBox(width: 12),
                                        Text(
                                          "Extremo sur de Colombia",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              fontFamily: 'Roboto'),
                                        )
                                      ]),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text("Description",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 26,
                                          )
                                          //.merge(TextStyle(color: Colors.black)),
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
                                      Text("Hidrografía",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 26,
                                          )
                                          //.merge(TextStyle(color: Colors.black)),
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
                                      Text("Parques naturales",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 26,
                                          )
                                          //.merge(TextStyle(color: Colors.black)),
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
                                    ]),
                              ),
                            )),
                          ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 9.2,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                            child: Column(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Container(
                                    width: size.width,
                                    height: 95,
                                    child: Stack(
                                      //overflow: Overflow.visible,
                                      children: [
                                        CustomPaint(
                                          size: Size(size.width, 96),
                                          painter: BNBCustomPainter(),
                                        ),
                                        Center(
                                          heightFactor: 1.5,
                                          child: FloatingActionButton(
                                              backgroundColor:
                                                  Colors.lightGreen,
                                              child:
                                                  Icon(Icons.shopping_basket),
                                              elevation: 0.1,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ShopPage()));

                                                setBottomBarIndex(0);
                                              }),
                                        ),
                                        Container(padding:const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 0),
                                          width: size.width,
                                          height: 90,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.values[1],
                                            children: [
                                              SizedBox.fromSize(
                                                size: Size(60, 60),
                                                // button width and height
                                                child: ClipOval(
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    // button color
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.lightGreen,
                                                      // splash color
                                                      onTap: () {
                                                        setBottomBarIndex(0);
                                                      },
                                                      // button pressed
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.home,
                                                            color: _currentIndex ==
                                                                    0
                                                                ? Colors
                                                                    .lightGreen
                                                                : Colors.grey
                                                                    .shade400,
                                                          ),
                                                          // icon
                                                          Text(
                                                            "Inicio",
                                                            style: TextStyle(
                                                              color: _currentIndex ==
                                                                      0
                                                                  ? Colors
                                                                      .lightGreen
                                                                  : Colors.grey
                                                                      .shade400,
                                                            ),
                                                          ),
                                                          // text
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox.fromSize(
                                                size: Size(60, 60),
                                                // button width and height
                                                child: ClipOval(
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    // button color
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.lightGreen,
                                                      // splash color
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        PhotoPage()));

                                                        setBottomBarIndex(2);
                                                      },
                                                      // button pressed
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.photo_library,
                                                            color: _currentIndex ==
                                                                    1
                                                                ? Colors
                                                                    .lightGreen
                                                                : Colors.grey
                                                                    .shade400,
                                                          ),
                                                          // icon
                                                          Text(
                                                            "Galería",
                                                            style: TextStyle(
                                                              color: _currentIndex ==
                                                                      1
                                                                  ? Colors
                                                                      .lightGreen
                                                                  : Colors.grey
                                                                      .shade400,
                                                            ),
                                                          ),
                                                          // text
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox.fromSize(
                                                size: Size(60, 60),
                                                // button width and height

                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                ),
                                              ),
                                              SizedBox.fromSize(
                                                size: Size(60, 60),
                                                child: ClipOval(
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    // button color// button width and height
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.lightGreen,
                                                      // splash color
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MapsPage()));

                                                        setBottomBarIndex(1);
                                                      },
                                                      // button pressed
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.location_pin,
                                                            color: _currentIndex ==
                                                                    1
                                                                ? Colors
                                                                    .lightGreen
                                                                : Colors.grey
                                                                    .shade400,
                                                          ),
                                                          // icon
                                                          Text(
                                                            "Mapa",
                                                            style: TextStyle(
                                                              color: _currentIndex ==
                                                                      1
                                                                  ? Colors
                                                                      .lightGreen
                                                                  : Colors.grey
                                                                      .shade400,
                                                            ),
                                                          ),
                                                          // text
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox.fromSize(
                                                size: Size(60, 60),
                                                child: ClipOval(
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    // button color// button width and height
                                                    child: InkWell(
                                                      splashColor: Colors.green,
                                                      // splash color
                                                      onTap: () async {
                                                        await FirebaseServices().singOut();
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        LoginPage()));

                                                        setBottomBarIndex(3);
                                                      },
                                                      // button pressed
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Icon(
                                                            Icons.logout,
                                                            color: _currentIndex ==
                                                                    3
                                                                ? Colors
                                                                    .lightGreen
                                                                : Colors.grey
                                                                    .shade400,
                                                          ),
                                                          // icon
                                                          Text(
                                                            "Salir",
                                                            style: TextStyle(
                                                              color: _currentIndex ==
                                                                      3
                                                                  ? Colors
                                                                      .lightGreen
                                                                  : Colors.grey
                                                                      .shade400,
                                                            ),
                                                          ),
                                                          // text
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          //    ]
                        ),
                      ],
                    ),
                  ),
                ),
              ]),

          //)))])
        ));
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 40); // Start
    path.quadraticBezierTo(size.width * 0.20, 20, size.width * 0.35, 20);
    path.quadraticBezierTo(size.width * 0.40, 20, size.width * 0.40, 40);
    path.arcToPoint(Offset(size.width * 0.60, 40),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 20, size.width * 0.65, 20);
    path.quadraticBezierTo(size.width * 0.80, 20, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
