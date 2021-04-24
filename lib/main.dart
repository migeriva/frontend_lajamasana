import 'package:flutter/material.dart';
import 'package:lajamasana/pantallas/pantallaInfoDia.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LaJamaSana',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: PantallaInformacionDia());
  }
}
