import 'package:flutter/material.dart';

import 'package:seccion10_fluttercourse/ui/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',
      routes: {'home': (_) => HomePage(), 'mapa': (_) => MapaPage()},
      theme: ThemeData(
          primaryColor: Colors.indigo,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.indigo)),
    );
  }
}
