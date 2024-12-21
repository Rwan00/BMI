import 'package:flutter/material.dart';
import 'result.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color.fromRGBO(68, 60, 104, 1),
          secondary: const Color.fromRGBO(99, 98, 133, 1),
        ),
        canvasColor: const Color.fromRGBO(24, 18, 43, 1),
        useMaterial3: false,
        /*iconTheme: const IconThemeData(
          color: Colors.white,
          size: 90
        ),*/
      ),
      home: const MyHomePage(),
    );
  }
}
