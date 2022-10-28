// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:startup/screen/login_screen.dart';
import 'package:startup/screen/random_words.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(StartUpNames());
}

class StartUpNames extends StatelessWidget {
  const StartUpNames({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StartUp Names",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginScreen(),
        "random": (context) => RandomWords(),
      },
    );
  }
}
