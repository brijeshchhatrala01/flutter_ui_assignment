import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> colors = [
    Colors.white,
    Colors.black,
    Colors.green,
    Colors.amber,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.blue,
    Colors.lime
  ];

  Color _defaultColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _defaultColor,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                Random random = Random();
                _defaultColor = colors[random.nextInt(colors.length)];
              });
            },
            child: const Text("Change Background")),
      ),
    );
  }
}
