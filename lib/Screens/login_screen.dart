import 'package:flutter/material.dart';
import 'package:seneca/Screens/screens.dart';
import 'package:seneca/widgets/input_field.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    
    Map<String, String> formValues = {
      "user" : "",
      "password" : ""
    };

    final textControllerUser = TextEditingController();
    final textControllerPassword = TextEditingController();

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

                    InputField(hintText: "Usuario", formProperty: "user", formValues: formValues, textController: textControllerUser),
                    const SizedBox(height: 20),
              
                    InputField(hintText: "Contraseña", obscureText: true, formProperty: "password", formValues: formValues, password: true, textController: textControllerPassword),
                    const SizedBox(height: 20),
              
                    ElevatedButton(
                      onPressed: () {
                        if(!myFormKey.currentState!.validate()) {
                          return;
                        }

                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => SecondScreen(user: formValues["user"].toString(), password: formValues["password"].toString()),)
                        );

                        textControllerUser.clear();
                        textControllerPassword.clear();
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
}