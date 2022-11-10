import 'package:flutter/material.dart';


import '../models/user.dart';
import '../services/firebase_api.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String _data = "Informacion: ";

  void _saveUser(User user) async {
    var result= await _firebaseApi.createUser(user);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void _registerUser(User user) async {
    var result = await _firebaseApi.registerUser(user.email, user.password);
    String msg = "";
    if (result == "invalid-email") {
      msg = "El correo no es valido";
    } else if (result == "week-password") {
      msg = "la contraseña debe tener minimo 6 caracteres";
    } else if (result == "email-already-in-use") {
      msg = "Correo ya existe";
    } else if (result == "network-request-failed") {
      msg = "Sin conexion a internet";
    } else{
      msg = " Usuario creado con exito";
    user.uid = result;
    _saveUser(user);
  }

    _ShowMsg(msg);

  }

  void _ShowMsg( String msg){
    final scaffold =ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
        SnackBar(content: Text(msg),
        action: SnackBarAction(
          label:'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
         ),
    );
    
  }

  void _onRegisterButtonClicked() {
    setState(() {
      if (_password.text == _repPassword.text) {
        var user = User(
          "", _name.text, _email.text, _password.text,);
        _registerUser(user);

      }else {
        _ShowMsg("Contraseñas no coinciden");

      }
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
