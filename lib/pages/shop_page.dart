import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hive_flutter/adapters.dart';

import 'package:untitled2/boxes.dart';

import 'package:untitled2/pages/home.dart';
import 'package:untitled2/pages/photo_pages.dart';
import 'package:untitled2/pages/maps_page.dart';
import 'package:untitled2/pages/login_page.dart';

import 'package:untitled2/models/local_place.dart';

import 'package:untitled2/pages/components/homepageStateProvider.dart';
import 'package:untitled2/pages/components/rating.dart';
import 'package:untitled2/pages/components/travelplace.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/splash.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.modulate),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.25,
                      child: const Image(
                        image: AssetImage('assets/images/store.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 26, left: 20, right: 20, bottom: 26),
                      height: size.height * 0.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.white),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Mis favoritos",
                              style: TextStyle(
                                height: 1.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(1.0),
                              child: _builListView(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 9.2),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 0),
                      child: Column(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: SizedBox(
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
                                      backgroundColor: Colors.white,
                                      elevation: 0.1,
                                      splashColor: Colors.lightGreen,
                                      onPressed: () {},
                                      child: const Icon(
                                        Icons.favorite_rounded,
                                        color: Colors.lightGreen,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 5),
                                    width: size.width,
                                    height: 90,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.values[1],
                                      children: [
                                        SizedBox.fromSize(
                                          size: const Size(60, 60),
                                          // button width and height
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.transparent,
                                              // button color
                                              child: InkWell(
                                                splashColor: Colors.lightGreen,
                                                // splash color
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Home()),
                                                  );
                                                },
                                                // button pressed
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.home,
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                    // icon
                                                    Text(
                                                      "Inicio",
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade400,
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
                                          size: const Size(60, 60),
                                          // button width and height
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                splashColor: Colors.lightGreen,
                                                // splash color
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const PhotoPage()),
                                                  );
                                                },
                                                // button pressed
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.photo_library,
                                                      color:
                                                          Colors.grey.shade400,
                                                    ),
                                                    // icon
                                                    Text(
                                                      "Galería",
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade400,
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
                                          size: const Size(60, 60),
                                          // button width and height
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                          ),
                                        ),
                                        SizedBox.fromSize(
                                          size: const Size(60, 60),
                                          // button width and height
                                          child: InkWell(
                                            splashColor: Colors.green,
                                            // splash color
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MapsPage()),
                                              );
                                            },
                                            // button pressed
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.location_pin,
                                                  color: Colors.grey.shade400,
                                                ),
                                                // icon
                                                Text(
                                                  "Mapa",
                                                  style: TextStyle(
                                                    color: Colors.grey.shade400,
                                                  ),
                                                ),
                                                // text
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox.fromSize(
                                          size: const Size(60, 60),
                                          // button width and height
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                splashColor: Colors.lightGreen,
                                                // splash color
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const LoginPage()),
                                                  );
                                                },
                                                // button pressed
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.logout,
                                                      color:
                                                          Colors.grey.shade400,
                                                    ), // icon
                                                    Text(
                                                      "Salir",
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey.shade400,
                                                      ),
                                                    ), // text
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _builListView() {
    return ValueListenableBuilder<Box<LocalPlace>>(
      valueListenable: Boxes.getFavoritesBox().listenable(),
      builder: (context, box, _) {
        final placeBox = box.values.toList().cast<LocalPlace>();
        return Column(
          children: <Widget>[
            SizedBox(
              height: 400,
              // wrap in Expanded
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: placeBox.length,
                itemBuilder: (BuildContext context, int index) {
                  final place = placeBox[index];
                  return Card(
                    child: ListTile(
                      leading: SizedBox(
                        height: double.maxFinite,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image(
                            image: AssetImage(place.image as String),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(place.name as String),
                      subtitle: rating(rating: place.rating as double, color: Colors.black54),
                      onLongPress: () {
                        setState(() {
                          place.delete();
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 40); // Start
    path.quadraticBezierTo(size.width * 0.20, 20, size.width * 0.35, 20);
    path.quadraticBezierTo(size.width * 0.40, 20, size.width * 0.40, 40);
    path.arcToPoint(Offset(size.width * 0.60, 40),
        radius: const Radius.circular(20.0), clockwise: false);
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
