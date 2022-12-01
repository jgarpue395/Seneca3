import 'package:flutter/material.dart';
import 'package:seneca/Screens/screens.dart';
import 'package:seneca/widgets/input_field.dart';
import 'package:seneca/models/user.dart';

class LoginScreen extends StatelessWidget {

  final List<User> usuarios;

  const LoginScreen({Key? key, required this.usuarios}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    
    Map<String, String> formValues = {
      "user" : "",
      "password" : ""
    };

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 58, 156),
      
      body: Center(
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              child: Form(
                key: myFormKey,
                child: Column(
                  children: [
                    const SizedBox(height: 135),
              
                    const Image(
                      image: AssetImage("assets/iseneca.png"),
                    ),

                    InputField(hintText: "Usuario", formProperty: "user", formValues: formValues),
                    const SizedBox(height: 20),
              
                    InputField(hintText: "Contraseña", obscureText: true, formProperty: "password", formValues: formValues, password: true),
                    const SizedBox(height: 20),
              
                    ElevatedButton(
                      onPressed: () {
                        if(!myFormKey.currentState!.validate()) {
                          return;
                        }

                        if (usuarios.isNotEmpty)
                        {
                          for (User usuario in usuarios) {
                            if (usuario.usuario == formValues["user"] && usuario.clave == formValues["password"])
                            {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => SecondScreen(user: formValues["user"].toString()))
                              );

                              return;
                            }
                          }  
                        }

                        mensajeError(context);
                      }, 
              
                      child: const SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Center(child: Text("Entrar")),
                      )
                    ),
              
                    const SizedBox(height: 50),
              
                    ElevatedButton(
                      onPressed: () => showDialog(context: context, builder: (BuildContext context) => const AlertDialog(content: FlutterLogo(size: 100))),
              
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent)),
              
                      child: const SizedBox(
                        child: Center(
                          child: Text("No recuerdo mi contraseña", style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
                        ),
                      ),
                    ),
              
                    const SizedBox(height: 30),
              
                    const Image(
                      image: AssetImage("assets/juntaDeAndalucia.png"),
                      height: 150
                    ),
                  ],
                )
              ),
            ),
          ),
        ),
      ),
    );
  }

  void mensajeError(BuildContext context) {
    showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          title: const Text("!Error¡"),
          content: const Text("Usuario o Contraseña Incorrecto"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text(
                "CERRAR",
                style: TextStyle(color: Color.fromARGB(255, 38, 45, 255)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
}