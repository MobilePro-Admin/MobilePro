import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8, vertical:16),
        child: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 16.0,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                    border:  OutlineInputBorder(), labelText: 'Hola'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                    border:  OutlineInputBorder(), labelText: 'Contraseña'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Image(image:AssetImage('assets/images/logo.png')),
            ],
          )

        ),
      )
    );
  }
}
