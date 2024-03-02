import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double fontSizeOfText = 14;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FontSize App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Recursion",
              style: TextStyle(fontSize: fontSizeOfText),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (fontSizeOfText <= 40) {
                      fontSizeOfText += 2;
                    } else {
                      fontSizeOfText = 40;
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Not Possible")));
                    }
                  });
                },
                child: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
