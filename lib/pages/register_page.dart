import 'package:flutter/material.dart';

import 'login_page.dart';

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

  final _formKey = GlobalKey<FormState>();

  String _data = "Informacion: ";

  void _onRegisterButtonClicked() {
    setState(() {
      _data = "Nombre: ${_name.text} \nCorreo ${_email.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/register.png'),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(
    Colors.white.withOpacity(0.5), BlendMode.screen)),
    ),
      child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.5),
          floatingActionButton: FloatingActionButton.small(
            elevation: 0,
            child: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            backgroundColor: Colors.lightBlue,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
          body: Form(
            key: _formKey,
            child: Padding(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese Nombre';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Correo'),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese un correo';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contraseña'),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingrese una contraseña';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor confirme la Contraseña';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                        _onRegisterButtonClicked();
                      },
                      child: const Text("Registrar"),
                    ),
                  ],
                ),
              )),
            ),
          )),
    );
  }
}
