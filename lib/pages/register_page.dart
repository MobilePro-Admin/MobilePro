import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  String _data = "Informacion: ";

  void _onRegisterButtonClicked() {
    setState(() {
      _data = "Nombre: ${_name.text} \nCorreo ${_email.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(image: AssetImage('assets/images/logo.png')),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Nombre'),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Correo'),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _password,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Contraseña'),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _repPassword,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirmar Contraseña'),
              keyboardType: TextInputType.text,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                _onRegisterButtonClicked();
              },
              child: const Text("Registrar"),
            ),
          ],
        ),
      )),
    )
    );
  }
}