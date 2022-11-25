import 'package:flutter/material.dart';

class Votos extends StatefulWidget {
  const Votos({Key? key}) : super(key: key);

  @override
  State<Votos> createState() => _VotosState();
}

class _VotosState extends State<Votos> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Votos"),
    );
  }
}
