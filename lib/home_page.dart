




import 'package:calculator_app/my_calculator_app.dart';
import 'package:flutter/material.dart';

class MyCalculatorApp extends StatelessWidget {
  const MyCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
      ),
      home: Calculator()
    );
  }
}