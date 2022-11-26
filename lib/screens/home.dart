// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/utils/bottom_nav.dart';
import 'package:flutter_application_1/utils/colors_util.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/services/firebase_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  BNavigator? myBNB;
  @override
  void initState() {
    myBNB = BNavigator(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hexStringToColor("ef4036"),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "                                   PokeApp                       "),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
              ),
              onPressed: () async {
                await FirebaseServices().signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text("Cerrar Sesión"),
            )
          ],
        ),
      ),
      bottomNavigationBar: myBNB,
      body: Routes(index: index),
    );
  }
}
