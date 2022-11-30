import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seneca/Screens/login_screen.dart';
import 'package:seneca/models/user.dart';
import 'package:seneca/providers/user_provider.dart';

class SecondScreen extends StatelessWidget {
  final String user;
  final String password;

  const SecondScreen({Key? key, required this.user, required this.password}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return FutureBuilder(
      future: userProvider.getUser(),
      builder: (_, AsyncSnapshot<List<User>> snapshot) {
        if (snapshot.hasData) {
          for (User usuario in snapshot.data!) {
            if (usuario.usuario == user && usuario.clave == password)
            {
              return exito(context);
            }
          }

          Navigator.pop(context);
        }
        
        return fallo();
      }
    );
  }

  Widget exito(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("ISENECA"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.exit_to_app)
          ),
        ],
      ),
    
      body: Center(
        child: Column(
          children: [ 
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image (
                    image: const AssetImage("assets/iseneca.png"),
                    color: Colors.blue[700],
                  ),
            
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(user),
                      const SizedBox(width: 10,),
                      const Icon(Icons.people)
                    ]
                  ),
          
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Text("C.E.I.P. Maestro Eduardo Lobillo", style: TextStyle(color: Colors.blue)),
          
                        SizedBox(height: 5),
          
                        Text("Perfil Profesorado", style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    
                  }, 
    
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Row(
                        children: const [
                          Icon(Icons.alarm),
                          Text("Entrar"),
                        ],
                      )
                    ),
                  )
                )
              ],
            )
          ]
        )
      ),
    );
  }

  Widget fallo() {
    return const Center(
      child: SizedBox(
        height: 300,
        width: 300,
        child: CircularProgressIndicator()
      )
    );
  }
}