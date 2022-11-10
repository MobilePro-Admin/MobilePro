//import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:untitled2/pages/photo_pages.dart';
import 'package:untitled2/pages/shop_page.dart';
import 'home.dart';
import 'login_page.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
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
    return Scaffold(
        body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.5), BlendMode.screen)),
        ),
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.5),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 16),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Container(
                            child: Container(
                              padding: EdgeInsets.only(top: 26, left: 20, right: 20),
                              height: size.height * 0.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.white),
                              child: SingleChildScrollView(

                              ),
                            )),
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 9.2,
            ),
            Center(child:
            SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding:const EdgeInsets.symmetric(vertical: 7.7, horizontal: 1),
                      child: Column(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              width: size.width,
                              height: 80,
                              child: Stack(
                                //overflow: Overflow.visible,
                                children: [
                                  CustomPaint(
                                    size: Size(size.width, 80),
                                    painter: BNBCustomPainter(),
                                  ),
                                  Center(
                                    heightFactor: 0.6,
                                    child: FloatingActionButton(
                                        backgroundColor: Colors.lightGreen,
                                        child: Icon(Icons.shopping_basket),
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
                                  Container(
                                    width: size.width,
                                    height: 80,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.home,
                                            color: _currentIndex == 1
                                                ? Colors.lightGreen
                                                : Colors.grey.shade400,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Home()));

                                            setBottomBarIndex(1);
                                          },
                                          splashColor: Colors.white,
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.photo_library,
                                              color: _currentIndex == 2
                                                  ? Colors.lightGreen
                                                  : Colors.grey.shade400,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PhotoPage()));

                                              setBottomBarIndex(2);
                                            }),
                                        Container(
                                          width: size.width * 0.20,
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.location_pin,
                                              color: _currentIndex == 0
                                                  ? Colors.lightGreen
                                                  : Colors.grey.shade400,
                                            ),
                                            onPressed: () {
                                              setBottomBarIndex(0);
                                            }),
                                        IconButton(
                                            icon: Icon(
                                              Icons.logout,
                                              color: _currentIndex == 3
                                                  ? Colors.lightGreen
                                                  : Colors.grey.shade400,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage()));

                                              setBottomBarIndex(3);
                                            }),
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
            ), ]),

          //)))])
        )
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
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
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