import 'package:flutter/material.dart';
import 'package:mobapps/SignUp.dart';
import 'package:mobapps/SignIn.dart';

void main() => runApp(const MaterialApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}
