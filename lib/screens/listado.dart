import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Listado extends StatelessWidget {
  const Listado({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int off = 0;
    int lim = 10;
    const url = "pokeapi.co";
    const urlid = "/api/v2/pokemon/";
    Map<String, String> queryParameters = <String, String>{
      'offset': off.toString(),
      'limit': lim.toString(),
    };
    fetchPokeData(url, urlid, queryParameters);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
            ),
            onPressed: () {
              print("Siguiente");
              queryParameters = {
                'offset': (off + 10).toString(),
                'limit': lim.toString()
              };
              off += 10;
              fetchPokeData(url, urlid, queryParameters);
            },
            child: Text("Siguiente")),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
          ),
          onPressed: () {
            print("Atras");
            if (off > 10) {
              queryParameters = {
                'offset': (off - 10).toString(),
                'limit': lim.toString()
              };
              off -= 10;
              fetchPokeData(url, urlid, queryParameters);
            } else {
              off = 0;
              queryParameters = {
                'offset': off.toString(),
                'limit': lim.toString()
              };
              fetchPokeData(url, urlid, queryParameters);
            }
          },
          child: Text("Atras"),
        ),
      ],
    ));
  }
}

void fetchPokeData(link, id, parametros) {
  List lista;
  var url = Uri.http(link, id, parametros);
  http.get(url).then((value) {
    if (value.statusCode == 200) {
      var dataJson = jsonDecode(value.body);
      lista = dataJson['results'];
      for (var i in lista) {
        print(i['name']);
      }
    }
  });
}
