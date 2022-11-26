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
                                "\n\n\n\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
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
