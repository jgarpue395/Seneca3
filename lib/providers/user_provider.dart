import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca/models/user.dart';

class UserProvider extends ChangeNotifier {

  UserProvider() {
    //getUser();
  }

  // final String _baseUrl = "script.google.com";
  // final String _spreadsheetId = "16Ax_Twg7XBxGOt_dIZEH7h3jLg8ESVhx9JWHl8DyESw";
  // final String _sheet = "usuarios";

  //List<User> userList = [];

  Future<String> _getJsonData() async {
    // var url = Uri.https(_baseUrl, endpoint,
    // {
    //  "spreadsheetId" : _spreadsheetId,
    //  "sheet" : _sheet,
    // });

    var url = "https://script.google.com/macros/s/AKfycbw1FDUd_xzmsszTMHvynzYDX-xzlEgLrUlHNDEmqp1R7xMtFFTABzQQbgp_li1ihjkm/dev?spreadsheetId=16Ax_Twg7XBxGOt_dIZEH7h3jLg8ESVhx9JWHl8DyESw&sheet=usuarios";
    var response = await http.get(Uri.parse(url));

    return response.body;
  }

  Future<List<User>> getUser() async {
    final jsonData = jsonDecode(await _getJsonData());

    final List<User> listaUsuarios = [];
    for (dynamic data in jsonData)
    {
      User usuario = User(
        id: data["id"], 
        usuario: data["usuario"],
        clave: data["clave"], 
      );

      listaUsuarios.add(usuario);
    }

    return listaUsuarios;
  }
}