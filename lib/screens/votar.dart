import 'package:flutter/material.dart';

class Votar extends StatefulWidget {
  const Votar({Key? key}) : super(key: key);

  @override
  State<Votar> createState() => _VotosState();
}

class _VotosState extends State<Votar> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Votar"),
    );
  }
}
