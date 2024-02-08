import 'package:flutter/material.dart';
import 'package:weather_app/features/homescreen/view/homescreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.blue.shade200)),
    );
  }
}
