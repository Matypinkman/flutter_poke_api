// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Busqueda extends StatefulWidget {
  const Busqueda({super.key});

  @override
  State<Busqueda> createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda> {
  int _pokemonId = 1;

  Map _pokemonInfo = {};
  final _pokemonIdController = TextEditingController();
  Future<void> _fetchPokemonInfo() async {
    // Obtiene el ID del Pokémon del controlador de texto
    _pokemonId = int.parse(_pokemonIdController.text);
    // Realiza una petición HTTP para obtener la información del Pokémon

    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${_pokemonId}'));

    // Si la petición fue exitosa, decodifica la respuesta y guarda la información del Pokémon
    if (response.statusCode == 200) {
      setState(() {
        _pokemonInfo = json.decode(response.body);
      });
    }
  }

  late Map<String, dynamic> _pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _pokemonIdController,
              decoration: InputDecoration(labelText: 'ID del Pokemón'),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                ),
                onPressed: _fetchPokemonInfo,
                child: Text("Buscar")),
            SizedBox(
              width: 450,
              height: 350,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                color: Colors.white,
                child: _pokemonInfo != null
                    ? Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.network(
                            _pokemonInfo['sprites']?['front_default'] ??
                                'http://geniussys.com/img/placeholder/blogpost-placeholder-100x100.png',
                            width: 100,
                            height: 100,
                          ),
                          Text(
                              style: TextStyle(fontSize: 25),
                              'ID: ${_pokemonInfo['id']}'),
                          Text(
                              style: TextStyle(fontSize: 25),
                              'Nombre: ${_pokemonInfo['name']}'),
                          Text(
                              style: TextStyle(fontSize: 25),
                              'Altura: ${_pokemonInfo['height']}'),
                          Text(
                              style: TextStyle(fontSize: 25),
                              'Peso: ${_pokemonInfo['weight']}'),
                          Text(
                              style: TextStyle(fontSize: 25),
                              'Tipos: ${_pokemonInfo['types']?.map((type) => type['type']['name']).join(', ') ?? 'Sin tipos'}'),
                          Text(
                              style: TextStyle(fontSize: 25),
                              'Formas: ${_pokemonInfo['forms']?.map((form) => form['name']).join(', ') ?? 'Sin formas'}'),
                          Text(
                              style: TextStyle(fontSize: 25),
                              'Habilidades: ${_pokemonInfo['abilities']?.map((ability) => ability['ability']['name']).join(', ') ?? 'Sin habilidades'}'),
                        ],
                      )
                    : Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
