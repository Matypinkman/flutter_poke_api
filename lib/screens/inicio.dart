// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/utem.png",
                  width: 500,
                  height: 250,
                ),
                RichText(
                  text: TextSpan(
                      text:
                          ("\n\n\nBienvenido a la PokeApp\n \nUsuario:  ${FirebaseAuth.instance.currentUser!.displayName}"),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <TextSpan>[
                        TextSpan(
                            text:
                                "\n\n\n\n¡Toda la informacion de los Pokemones en una aplicacion! \nEsta aplicacion consume una API de Pokemon, que contiene la informacion de los Pokemones de todas las series.\n\n\n Este proyecto fue realizado por: \n- Matías Alarcón Guajardo \n-Ismael Jara Gutiérrez \n-Juan González Ponce \n-Karina Sánchez Grissel \n-Matías Silva Farías",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ))
                      ]),
                  textAlign: TextAlign.center,
                ),
                Image.asset(
                  "assets/images/pikachu.jpeg",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        ]);
  }
}
