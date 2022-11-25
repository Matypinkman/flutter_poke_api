import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/busqueda.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/inicio.dart';
import 'package:flutter_application_1/screens/listado.dart';
import 'package:flutter_application_1/screens/votar.dart';
import 'package:flutter_application_1/screens/votos.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const Inicio(),
      const Busqueda(),
      const Listado(),
      const Votar(),
      const Votos()
    ];
    return myList[index];
  }
}
