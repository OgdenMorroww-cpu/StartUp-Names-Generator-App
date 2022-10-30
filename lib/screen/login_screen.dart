// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, sized_box_for_whitespace, unused_import, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:startup/auth/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: !isLoading
            ? Center(
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
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          FireBaseService service = FireBaseService();
                          try {
                            await service.signInWithGoogle();
                            Navigator.pushNamedAndRemoveUntil(
                                context, "random", (route) => false);
                          } catch (e) {
                            if (e is FirebaseAuthException) {
                              showMessage(e.message!);
                            }
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        textColor: Colors.black,
                        color: Colors.white,
                        height: 55.5,
                        elevation: 0.5,
                        minWidth: 230.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(FontAwesomeIcons.google),
                            Text(
                              "Continue with google",
                              style: TextStyle(
                                fontSize: 20.2,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.5),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SpinKitCircle(
                color: Colors.white,
                size: 55.5,
              ),
      ),
    );
  }

  void showMessage(String message) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
