import 'package:flutter/material.dart';
import 'package:untitled2/firebase_options.dart';
import 'package:untitled2/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'Amazonas',
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazonas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}


