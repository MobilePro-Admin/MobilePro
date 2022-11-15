import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/pages/home.dart';
import 'package:untitled2/pages/photo_pages.dart';
import 'package:untitled2/pages/shop_page.dart';
import 'package:untitled2/pages/maps_page.dart';
import 'package:untitled2/pages/login_page.dart';
import 'package:untitled2/models/model_gridview.dart';
import 'package:untitled2/pages/components/rating.dart';

import 'package:untitled2/data/gridview.dart';
import 'package:untitled2/pages/components/restAPI.dart';
import 'package:untitled2/pages/components/locationDetails.dart';
import 'package:untitled2/pages/components/placesModel.dart';


class DetailsPage extends StatelessWidget {
  final ModelGridview gridview;

  const DetailsPage({Key? key, required this.gridview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/splash.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.screen),
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
                        image: AssetImage('assets/images/gallery.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 26, left: 20, right: 20, bottom: 26),
                      height: size.height * 0.55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.asset(
                                  gridview.image, //gridviews.image,
                                  width: 600,
                                  height: 240,
                                  fit: BoxFit.cover,
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
                                    onPressed: () {})
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      Container(
                                        padding: const EdgeInsets.only(bottom: 8),
                                        child: Text(
                                          gridview.name,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Amazonas, Colombia",
                                        style: TextStyle(color: Colors.grey[500],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                  rating(rating: gridview.rating, color: Colors.black54)
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildButtonColumn(Colors.lightBlue, Icons.call, 'CONTACTO'),
                                _buildButtonColumn(Colors.lightBlue, Icons.near_me, 'RUTA'),
                                _buildButtonColumn(Colors.lightBlue, Icons.share, 'COMPARTIR'),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                gridview.description,
                                softWrap: true,
                                textAlign: TextAlign.justify,
                              ),
                            )
                            //margin: const EdgeInsets.all(16),
                            //child: const Text("Aquí se llamaría el componente locationDetails, pero no sé cómo :( y se tendría que enviar como parámetros los valores de la tarjetica a la que se le hizo clic"),
                            //locationDetails({placeTitle: "Leticia", imgUrl: "assets/images/leticia.jpg", rating: 3.8, description: "Es la capital del departamento y se encuentra a hora y media de Bogotá por vía aérea. Leticia es una ciudad muy visitada por los turistas, quienes fascinados por la exótica cultura amazónica llegan a ella desde diferentes lugares del mundo."})
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: SizedBox(
                      width: size.width,
                      height: 96,
                      child: Stack(
                        children: [
                          CustomPaint(
                            size: Size(size.width, 96),
                            painter: BNBCustomPainter(),
                          ),
                          Center(
                            heightFactor: 1.5,
                            child: FloatingActionButton(
                              backgroundColor: Colors.lightGreen,
                              elevation: 0.1,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShopPage()));
                              },
                              child: const Icon(Icons.favorite_rounded),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                            width: size.width,
                            height: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.values[1],
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
                                              builder: (context) => const Home()
                                            ),
                                          );
                                          //setBottomBarIndex(1);
                                        },
                                        // button pressed
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.home,
                                              color: Colors.grey.shade400,
                                              //color: _currentIndex == 1
                                              // ? Colors.lightGreen
                                              // : Colors.grey.shade400,
                                            ),
                                            // icon
                                            Text(
                                              "Inicio",
                                              style: TextStyle(
                                                color: Colors.grey.shade400,
                                                  //color: _currentIndex == 1
                                                  //  ? Colors.lightGreen
                                                  //   : Colors.grey.shade400,
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
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      // button width and height
                                      child: InkWell(
                                        splashColor: Colors.lightGreen,
                                        // splash color
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const PhotoPage()
                                            ),
                                          );
                                          //setBottomBarIndex(0);
                                        },
                                        // button pressed
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const <Widget>[
                                            Icon(
                                              Icons.photo_library,
                                              color: Colors.lightGreen,
                                              //color: _currentIndex == 0
                                              //   ? Colors.lightGreen
                                              //  : Colors.grey.shade400,
                                            ),
                                            // icon
                                            Text(
                                              "Galería",
                                              style: TextStyle(
                                                color: Colors.lightGreen,
                                                  // color: _currentIndex == 0
                                                  //   ? Colors.lightGreen
                                                  //   : Colors.grey.shade400,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ),
                                SizedBox.fromSize(
                                  size: const Size(60, 60),
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      // button width and height
                                      child: InkWell(
                                        splashColor: Colors.lightGreen,
                                        // splash color
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MapsPage()));

                                          // setBottomBarIndex(2);
                                        },
                                        // button pressed
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_pin,
                                              color: Colors.grey.shade400,
                                              // color: _currentIndex == 2
                                              //   ? Colors.lightGreen
                                              //  : Colors.grey.shade400,
                                            ),
                                            // icon
                                            Text(
                                              "Mapa",
                                              style: TextStyle(
                                                color: Colors.grey.shade400,
                                                  // color: _currentIndex == 2
                                                  //    ? Colors.lightGreen
                                                  //    : Colors.grey.shade400,
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
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      // button width and height
                                      child: InkWell(
                                        splashColor: Colors.lightGreen,
                                        // splash color
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()));

                                          // setBottomBarIndex(3);
                                        },
                                        // button pressed
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.logout,
                                              color: Colors.grey.shade400,
                                              // color: _currentIndex == 3
                                              //     ? Colors.lightGreen
                                              //     : Colors.grey.shade400,
                                            ),
                                            // icon
                                            Text(
                                              "Salir",
                                              style: TextStyle(
                                                color: Colors.grey.shade400,
                                                  // color: _currentIndex == 3
                                                  //     ? Colors.lightGreen
                                                  //     : Colors.grey.shade400,
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
          ],
        ),
      ),
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
