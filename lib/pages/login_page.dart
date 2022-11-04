import 'package:flutter/material.dart';
import 'package:untitled2/pages/home.dart';
import 'package:untitled2/pages/register_page.dart';
import 'package:untitled2/services/firebase_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.modulate)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
                  //child: Center (
                  child: SingleChildScrollView(
                    child: Column(
                      //ainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: <Widget>[
                        Container(
                            child: Image(
                          image: AssetImage('assets/images/gifimage.gif'),
                          width: 180,
                        )),
                        const SizedBox(
                          height: 16.0,
                        ),
                        TextFormField(
                          controller: _email,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Correo',
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            fillColor: Colors.white24,
                            filled: true,),
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
                              labelText: 'Contraseña',
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            fillColor: Colors.white24,
                            filled: true,                          ),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese la contraseña';
                            }
                            return null;
                          },

                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 18),
                          ),
                          onPressed: () async {
                            await FirebaseServices().singInWithGoogle();

                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: const Text('Iniciar'),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Colors.lightBlue),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          child: const Text(
                            'Registrar',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  )),
            )
            //),
            //],
            //),
            ),
      ),
    );
  }
}
