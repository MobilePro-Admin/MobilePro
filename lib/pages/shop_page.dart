import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitled2/boxes.dart';
import 'package:untitled2/models/local_favorites.dart';
import 'package:untitled2/pages/components/rating.dart';
import 'package:untitled2/pages/photo_pages.dart';
import 'home.dart';
import 'login_page.dart';
import 'maps_page.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/splash.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.modulate),
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
                      padding: const EdgeInsets.only(top: 26, left: 20, right: 20, bottom: 26),
                      height: size.height * 0.55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Colors.white
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Mis favoritos",
                              style: TextStyle(height: 1.0,
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
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
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
                                                },
                                                // button pressed
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.home,
                                                      color: Colors.grey.shade400,
                                                    ),
                                                    // icon
                                                    Text(
                                                      "Inicio",
                                                      style: TextStyle(
                                                        color: Colors.grey.shade400,
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
                                                      builder: (context) => const PhotoPage()
                                                    ),
                                                  );
                                                },
                                                // button pressed
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.photo_library,
                                                      color: Colors.grey.shade400,
                                                    ),
                                                    // icon
                                                    Text(
                                                      "Galería",
                                                      style: TextStyle(
                                                        color: Colors.grey.shade400,
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
                                          // button width and height
                                          child: InkWell(
                                            splashColor: Colors.green,
                                            // splash color
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => MapsPage()
                                                ),
                                              );
                                            },
                                            // button pressed
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.location_pin,
                                                  color: Colors.grey.shade400,
                                                ),
                                                // icon
                                                Text(
                                                  "Mapa",
                                                  style: TextStyle(
                                                    color:Colors.grey.shade400,
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
                                                      builder: (context) => const LoginPage()
                                                    ),
                                                  );
                                                },
                                                // button pressed
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.logout,
                                                      color: Colors.grey.shade400,
                                                    ), // icon
                                                    Text(
                                                      "Salir",
                                                      style: TextStyle(
                                                        color: Colors.grey.shade400,
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
    return ValueListenableBuilder<Box<LocalFavorites>>(
      valueListenable: Boxes.getFavoritesBox().listenable(),
      builder: (context, box, _) {
        final placeBox = box.values.toList().cast<LocalFavorites>();
        return ListView.builder(
          itemCount: placeBox.length,
          itemBuilder: (BuildContext context, int index) {
            final place = placeBox[index];
            return Stack(
              children: [
                SizedBox(
                  height: double.maxFinite,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      image: AssetImage(place.image as String),
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
                    onPressed: () {},
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
                        borderRadius: BorderRadius.circular(12), color: Colors.black.withAlpha(90)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        Row(
                          children: [
                          rating(rating: place.rating as double)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      }
    );
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
