import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled2/pages/home.dart';
import 'package:untitled2/pages/register_page.dart';
import 'package:untitled2/services/firebase_api.dart';
import 'package:untitled2/services/firebase_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final FirebaseApi _firebaseApi = FirebaseApi();

  final _formKey = GlobalKey<FormState>();

  void _showMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _validateUser() async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      _showMsg("Debe ingresar correo y/o contraseña");
    } else {
      var result = await _firebaseApi.logInUser(_email.text, _password.text);
      String msg = "";
      if (result == "invalid-email") {
        _showMsg("El correo no es valido");
      } else if (result == "wrong-password") {
        _showMsg("correo o contraseña es incorrecto");
      } else if (result == "network-request-failed") {
        _showMsg("Sin conexion a internet");
      } else
       Navigator.pushReplacement(
          (context), MaterialPageRoute(builder: (context) => Home()));

    }
  }

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
                            filled: true,
                          ),
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
                            filled: true,
                          ),
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
                            _validateUser();

                           if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: const Text('Iniciar'),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white, onPrimary: Colors.black),
                          icon: Image.network(
                            'http://pngimg.com/uploads/google/google_PNG19635.png',
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                          /*FaIcon(FontAwesomeIcons.google,color: Colors.red, ),*/
                          label: const Text('Iniciar con Google'),
                          onPressed: () async {
                            await FirebaseServices().singInWithGoogle();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
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
