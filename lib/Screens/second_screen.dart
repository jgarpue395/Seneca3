import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String user;

  const SecondScreen({Key? key, required this.user}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
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
}