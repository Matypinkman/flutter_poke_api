// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/services/firebase_services.dart';
import 'package:flutter_application_1/utils/bottom_nav.dart';
import 'package:flutter_application_1/utils/routes.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            SizedBox(
              height: 20,
            ),
            Text("${FirebaseAuth.instance.currentUser!.displayName}"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            ElevatedButton(
              onPressed: () async {
                await FirebaseServices().signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text("Cerrar Sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
