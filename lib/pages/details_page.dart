import 'package:flutter/material.dart';

import 'package:untitled2/boxes.dart';

import 'package:untitled2/pages/home.dart';
import 'package:untitled2/pages/photo_pages.dart';
import 'package:untitled2/pages/shop_page.dart';
import 'package:untitled2/pages/maps_page.dart';
import 'package:untitled2/pages/login_page.dart';

import 'package:untitled2/models/model_gridview.dart';
import 'package:untitled2/models/local_place.dart';
import 'package:untitled2/pages/components/rating.dart';

class DetailsPage extends StatefulWidget {
  final ModelGridview place;

  const DetailsPage({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var isFavorite = false;

  @override
  void initState() {
    _getLocalPlace();
    super.initState();
  }

  void _getLocalPlace() {
    final box = Boxes.getFavoritesBox();
    box.values.forEach((element) {
      if (element.id == widget.place.id) {
        isFavorite = true;
      }
    });
  }

  void _onFavoritesButtonClicked() async {
    var localPlace = LocalPlace()
      ..id = widget.place.id
      ..name = widget.place.name
      ..image = widget.place.image
      ..description = widget.place.description
      ..rating = widget.place.rating;

    final box = Boxes.getFavoritesBox();

    if (isFavorite) {
      box.delete(localPlace.id);
    } else {
      box.put(localPlace.id, localPlace);
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }

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
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.5), BlendMode.screen),
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
                      padding: const EdgeInsets.only(
                          top: 26, left: 20, right: 20, bottom: 26),
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
                                  widget.place.image,
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
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 20,
                                    ),
                                    color: Colors.red,
                                    onPressed: (() {
                                      _onFavoritesButtonClicked();
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 8),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text(
                                          widget.place.name,
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Amazonas, Colombia",
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    rating(
                                        rating: widget.place.rating,
                                        color: Colors.black54)
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildButtonColumn(
                                    Colors.lightBlue, Icons.call, 'CONTACTO'),
                                _buildButtonColumn(
                                    Colors.lightBlue, Icons.near_me, 'RUTA'),
                                _buildButtonColumn(
                                    Colors.lightBlue, Icons.share, 'COMPARTIR'),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                widget.place.description,
                                softWrap: true,
                                textAlign: TextAlign.justify,
                              ),
                            )
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
                                    builder: (context) => const ShopPage(),
                                  ),
                                );
                              },
                              child: const Icon(Icons.favorite_rounded),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                            width: size.width,
                            height: 90,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.values[1],
                              children: [
                                SizedBox.fromSize(
                                  size: const Size(60, 60),
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashColor: Colors.lightGreen,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Home(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.home,
                                              color: Colors.grey.shade400,
                                            ),
                                            Text(
                                              "Inicio",
                                              style: TextStyle(
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
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
                                      child: InkWell(
                                        splashColor: Colors.lightGreen,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const PhotoPage(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const <Widget>[
                                            Icon(
                                              Icons.photo_library,
                                              color: Colors.lightGreen,
                                            ),
                                            Text(
                                              "Galería",
                                              style: TextStyle(
                                                color: Colors.lightGreen,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox.fromSize(
                                  size: const Size(60, 60),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ),
                                SizedBox.fromSize(
                                  size: const Size(60, 60),
                                  child: ClipOval(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashColor: Colors.lightGreen,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MapsPage(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_pin,
                                              color: Colors.grey.shade400,
                                            ),
                                            Text(
                                              "Mapa",
                                              style: TextStyle(
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
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
                                      child: InkWell(
                                        splashColor: Colors.lightGreen,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage(),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.logout,
                                              color: Colors.grey.shade400,
                                            ),
                                            Text(
                                              "Salir",
                                              style: TextStyle(
                                                color: Colors.grey.shade400,
                                              ),
                                            ),
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
