import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/homescreen/view/homescreen.dart';
import 'package:weather_app/features/homescreen/viewmodel/homescreen_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomescreenBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homescreen(),
        theme: ThemeData(
            primarySwatch: Colors.blue,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.blue.shade200)),
      ),
    );
  }
}
