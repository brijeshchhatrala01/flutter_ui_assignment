import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReverseApp(),
    );
  }
}

class ReverseApp extends StatefulWidget {
  const ReverseApp({super.key});

  @override
  State<ReverseApp> createState() => _ReverseAppState();
}

class _ReverseAppState extends State<ReverseApp> {
  final _numberController = TextEditingController();

  bool isNull = false;
  String result = "";

  _reverseNumber() {
    int num = int.parse(_numberController.text.toString());
    int reverseNum = 0;
    while (num > 0) {
      int reminder = num % 10;
      reverseNum = reverseNum * 10 + reminder;
      num ~/= 10;
    }
    return reverseNum;
  }

  _showTextResult() {
    isNull
        ? result = "Not Available"
        : result = "Reverse Number : ${_reverseNumber()}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reverse Number App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                errorText: isNull ? "Please Enter Value" : null,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isNull = _numberController.text.isEmpty;
                    _showTextResult();
                  });
                },
                child: const Text("Click")),
            const SizedBox(
              height: 20,
            ),
            Text(result)
          ],
        ),
      ),
    );
  }
}
