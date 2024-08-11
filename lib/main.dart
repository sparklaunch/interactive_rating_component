import 'package:flutter/material.dart';
import 'package:interactive_rating_component/screens/main_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(20, 21, 24, 1),
        body: MainScreen(),
      ),
    ),
  );
}
