import 'package:flutter/material.dart';

enum ColorsOfApp { red, blue, yellow, green, deepPurple, orange, white, lime }

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ColorsOfApp colorsOfApp = ColorsOfApp.white;
  Color defaultBackGround = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackGround,
      appBar: AppBar(
        backgroundColor: defaultBackGround,
        title: const Text("Radio Color App"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Radio(
              value: ColorsOfApp.blue,
              groupValue: colorsOfApp,
              onChanged: (value) {
                setState(() {
                  colorsOfApp = value!;
                  defaultBackGround = Colors.blue;
                });
              },
            ),
            title: const Text(
              "Blue",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Radio(
              value: ColorsOfApp.red,
              groupValue: colorsOfApp,
              onChanged: (value) {
                setState(() {
                  colorsOfApp = value!;
                  defaultBackGround = Colors.red;
                });
              },
            ),
            title: const Text(
              "Red",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Radio(
              value: ColorsOfApp.yellow,
              groupValue: colorsOfApp,
              onChanged: (value) {
                setState(() {
                  colorsOfApp = value!;
                  defaultBackGround = Colors.yellow;
                });
              },
            ),
            title: const Text(
              "Yellow",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Radio(
              value: ColorsOfApp.lime,
              groupValue: colorsOfApp,
              onChanged: (value) {
                setState(() {
                  colorsOfApp = value!;
                  defaultBackGround = Colors.lime;
                });
              },
            ),
            title: const Text(
              "Lime",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Radio(
              value: ColorsOfApp.green,
              groupValue: colorsOfApp,
              onChanged: (value) {
                setState(() {
                  colorsOfApp = value!;
                  defaultBackGround = Colors.green;
                });
              },
            ),
            title: const Text(
              "Green",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Radio(
              value: ColorsOfApp.deepPurple,
              groupValue: colorsOfApp,
              onChanged: (value) {
                setState(() {
                  colorsOfApp = value!;
                  defaultBackGround = Colors.deepPurple;
                });
              },
            ),
            title: const Text(
              "Deep Purple",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Radio(
              value: ColorsOfApp.orange,
              groupValue: colorsOfApp,
              onChanged: (value) {
                setState(() {
                  colorsOfApp = value!;
                  defaultBackGround = Colors.orange;
                });
              },
            ),
            title: const Text(
              "Orange",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Radio(
              value: ColorsOfApp.white,
              groupValue: colorsOfApp,
              onChanged: (value) {
                setState(() {
                  colorsOfApp = value!;
                  defaultBackGround = Colors.white;
                });
              },
            ),
            title: const Text(
              "White",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
