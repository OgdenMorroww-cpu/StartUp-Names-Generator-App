// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, sized_box_for_whitespace, unused_import, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? userResult = FirebaseAuth.instance.currentUser;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "StartUp Name",
                style: TextStyle(
                  fontSize: 22.2,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 55.5),
              Image.asset(
                "asset/startup.png",
                width: 150.5,
                height: 150.5,
              ),
              SizedBox(height: 55.9),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: MaterialButton(
                  onPressed: () {
                    userResult == null
                        ? Navigator.pushNamed(context, "loginscreen")
                        : Navigator.pushReplacementNamed(context, "random");
                  },
                  textColor: Colors.black,
                  color: Colors.white,
                  height: 55.5,
                  elevation: 0.5,
                  minWidth: 230.5,
                  child: Text(
                    "Get started",
                    style: TextStyle(
                      fontSize: 20.2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
