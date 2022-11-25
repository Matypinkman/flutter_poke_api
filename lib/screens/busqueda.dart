import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Busqueda extends StatelessWidget {
  const Busqueda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: "Ingrese el ID del Pokemon",
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}
