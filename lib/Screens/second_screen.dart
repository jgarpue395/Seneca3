import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String user;

  const SecondScreen({Key? key, required this.user}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      body: Stack(
        children: [
          Container(
            color: Colors.blue[800],
            width: double.infinity,
            height: 200,
            child: const Image (
              image: AssetImage("assets/iseneca.png"),
            ),
          ),
      
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 15),
              width: 360,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row (
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(user),
                        const SizedBox(width: 250),
                        IconButton(
                          icon: const Icon(Icons.people), 
                          onPressed: () { 
                            Navigator.pop(context);
                          },
                        )
                      ]
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                        Text("C.E.I.P. Maestro Eduardo Lobillo", style: TextStyle(color: Colors.blue,)),
            
                        SizedBox(height: 5),
            
                        Text("Perfil Profesorado", style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                    ),
                    height: 75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent)),
                          onPressed: () {
                            
                          }, 
        
                          child: SizedBox(
                            height: 50,
                            width: 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.alarm, color: Colors.white),
                                Text("  Avisos", style: TextStyle(color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          )
                        ),

                        const VerticalDivider(color: Colors.white,),

                        ElevatedButton(
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.transparent)),
                          onPressed: () {}, 

                          child: SizedBox(
                            height: 50,
                            width: 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.account_balance_wallet, color: Colors.white),
                                Text(" Bandeja de firmas", style: TextStyle(color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          Column(
            children: [
              Row(
                children: const [
                  Image(image: AssetImage("assets/sombrero.png"))
                ],
              )
            ]
          )
        ],
      ),
    );
  }
}