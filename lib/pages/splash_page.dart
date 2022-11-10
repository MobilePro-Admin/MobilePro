import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/pages/login_page.dart';

import 'home.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    _closeSplash();
    super.initState();
  }

  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 3), () async {
      /*var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }else {*/
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()));
     // }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'),
              fit: BoxFit.fill,
              //colorFilter: ColorFilter.mode(
                  //Colors.white.withOpacity(0.8), BlendMode.modulate)),
          )),
      ),
    );
  }
}
