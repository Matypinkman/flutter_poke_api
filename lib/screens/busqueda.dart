// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Busqueda extends StatefulWidget {
  const Busqueda({super.key});

  @override
  State<Busqueda> createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda> {
  TextEditingController _idvalue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TextField(
          controller: _idvalue,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: "Ingrese el ID del Pokemon",
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black87,
            ),
            onPressed: () {
              String ID_Poke = _idvalue.text;
              var url = "pokeapi.co";
              var urlid = "/api/v2/pokemon/$ID_Poke";
              fetchPokeData(url, urlid);
            },
            child: Text("Buscar"))
      ],
    );
  }
}

void fetchPokeData(link, id) {
  List Pokedex;
  var url = Uri.http(link, id);
  http.get(url).then((value) {
    if (value.statusCode == 200) {
      var dataJson = jsonDecode(value.body);
    }
  });
}
