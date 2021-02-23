import 'package:flutter/material.dart';
import 'package:lajamasana/pantallas/pantallaloginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LaJamaSana',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: LoginPage()
    );
  }
}
