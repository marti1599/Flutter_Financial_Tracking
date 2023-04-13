import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/views/HomePage.dart';

///
/// Documantation:
///   Finance API:
///     The API i decided to use is https://www.alphavantage.co/
///     Finance API key: W11MP2QL3HTKN1SS
///

/// This is the main function that runs the MainApp in Dart.
void main() {
  runApp(const MainApp());
}

/// The MainApp class returns a MaterialApp with a dark system overlay style for the app bar and a
/// HomePage as the home screen.
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
