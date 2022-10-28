// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(55.5),
                child: Image.asset("asset/startup.png"),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "random");
                  },
                  textColor: Colors.black,
                  color: Colors.white,
                  height: 55.5,
                  elevation: 0.5,
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 22.5,
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
