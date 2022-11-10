//import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/data/gridview.dart';
import 'package:untitled2/models/model_gridview.dart';
import 'package:untitled2/pages/components/placesModel.dart';
import 'package:untitled2/pages/components/restAPI.dart';
import 'package:untitled2/pages/home.dart';
import 'package:untitled2/pages/shop_page.dart';
import 'package:untitled2/pages/maps_page.dart';
import 'package:untitled2/pages/login_page.dart';
import 'package:untitled2/pages/details_page.dart';
import 'package:untitled2/pages/components/homepageStateProvider.dart';
import 'package:untitled2/pages/components/travelplace.dart';
import 'package:untitled2/services/firebase_services.dart';


class PhotoPage extends StatefulWidget {
  final ModelGridview? gridview;
  const PhotoPage({Key? key, this.gridview,}) : super(key:key);

  @override
  _PhotoPageState createState() => _PhotoPageState();

}

class _PhotoPageState extends State<PhotoPage> {
  int _currentIndex = 0;


  setBottomBarIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    HomePageStateProvider homepagestate = Provider.of<HomePageStateProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/images/splash.png'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.screen)
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
                          padding: const EdgeInsets.only(top: 26, left: 20, right: 20),
                          height: size.height * 0.55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.white,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Lugares turísticos",
                                  style: TextStyle(height: 1.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                Container(

                                  margin: EdgeInsets.all(1.0),
                                  child: StreamBuilder(
                                      stream: homepagestate.getAllPlaces().asStream(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Container(padding:const EdgeInsets.all(16),
                                              alignment: Alignment.center,
                                              width: 200,
                                              height: 200,
                                              child: const CircularProgressIndicator());
                                        }
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return Container(padding:const EdgeInsets.all(16),
                                              alignment: Alignment.center,
                                              width: 200,
                                              height: 200,
                                              child: const CircularProgressIndicator());
                                        }
                                        return GridView.builder(padding:const EdgeInsets.only(top: 20.0),
                                            itemCount: snapshot.data?.length,
                                            shrinkWrap: true,
                                            primary: false,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    mainAxisSpacing: 16,
                                                    crossAxisSpacing: 16,
                                                    crossAxisCount: 2),
                                            itemBuilder: (context, index) {
                                          final gridviews = gridview[index];
                                              return GestureDetector(
                                                  onTap: () {
                                                    gridviews.copy();
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => DetailsPage(gridview: gridviews)

                                                        ),
                                                    );
                                                  },
                                                  child: travelCard(snapshot.data![index]),
                                              );
                                            },
                                        );
                                      },
                                  ),
                                ),
                              ]),
                          ),
                        ),
                      ],
                    ),
                  )),


              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Column(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: size.width,
                        height: 96,
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
                                  backgroundColor: Colors.lightGreen,
                                  elevation: 0.1,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShopPage()));
                                  },
                                  child: const Icon(Icons.favorite_rounded)),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
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
                                                MaterialPageRoute( builder: (context) => const Home()));
                                            setBottomBarIndex(1);
                                          },
                                          // button pressed
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.home,
                                                color: _currentIndex == 1
                                                    ? Colors.lightGreen
                                                    : Colors.grey.shade400,
                                              ),
                                              // icon
                                              Text(
                                                "Inicio",
                                                style: TextStyle(
                                                  color: _currentIndex == 1
                                                      ? Colors.lightGreen
                                                      : Colors.grey.shade400,
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
                                          onTap: () {},
                                          // button pressed
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.photo_library,
                                                color: _currentIndex == 0
                                                    ? Colors.lightGreen
                                                    : Colors.grey.shade400,
                                              ),
                                              // icon
                                              Text(
                                                "Galería",
                                                style: TextStyle(
                                                  color: _currentIndex == 0
                                                      ? Colors.lightGreen
                                                      : Colors.grey.shade400,
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

                                            setBottomBarIndex(2);
                                          },
                                          // button pressed
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.location_pin,
                                                color: _currentIndex == 2
                                                    ? Colors.lightGreen
                                                    : Colors.grey.shade400,
                                              ),
                                              // icon
                                              Text(
                                                "Mapa",
                                                style: TextStyle(
                                                  color: _currentIndex == 2
                                                      ? Colors.lightGreen
                                                      : Colors.grey.shade400,
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
                                          onTap: ()async {
                                            await FirebaseServices().singOut();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage()));

                                            setBottomBarIndex(3);
                                          },
                                          // button pressed
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.logout,
                                                color: _currentIndex == 3
                                                    ? Colors.lightGreen
                                                    : Colors.grey.shade400,
                                              ),
                                              // icon
                                              Text(
                                                "Salir",
                                                style: TextStyle(
                                                  color: _currentIndex == 3
                                                      ? Colors.lightGreen
                                                      : Colors.grey.shade400,
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
            ]))
        // ))]))
        );
  }
}


/*class CardImages extends StatelessWidget {
  const CardImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
*/



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
