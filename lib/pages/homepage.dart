import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: checkBoxValue,
              onChanged: (value) {
                setState(() {
                  checkBoxValue = !checkBoxValue;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            if (checkBoxValue) const Text("CheckBox Checked!")
          ],
        ),
      ),
    );
  }
}
