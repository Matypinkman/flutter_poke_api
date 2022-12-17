import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/pokemon_list.dart';

class Listado extends StatelessWidget {
  const Listado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PokemonList(),
      ],
    );
  }
}
