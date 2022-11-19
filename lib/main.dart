import 'package:calculator/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
