import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/services/firebase_services.dart';
import 'package:flutter_application_1/utils/colors_util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("0e8a57"),
          hexStringToColor("3c7c94"),
          hexStringToColor("05627b")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
                onPressed: () async {
                  await FirebaseServices().signInWithGoogle();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.black26;
                  }
                  return Colors.white;
                })),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google.png",
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Iniciar Sesión con Google",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
