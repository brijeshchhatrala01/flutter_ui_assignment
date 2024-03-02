import 'package:flutter/material.dart';

class ShowNumbers extends StatefulWidget {
  final int firstNum;
  final int secondNum;
  ShowNumbers({super.key, required this.firstNum, required this.secondNum});

  @override
  State<ShowNumbers> createState() => _ShowNumbersState();
}

class _ShowNumbersState extends State<ShowNumbers> {
  List<int> numbers = [];

  _printNumber() {
    if (widget.firstNum > widget.secondNum) {
      for (int i = widget.firstNum - 1; i > widget.secondNum; i--) {
        numbers.add(i);
      }
    } else if (widget.firstNum < widget.secondNum) {
      for (int i = widget.firstNum + 1; i < widget.secondNum; i++) {
        numbers.add(i);
      }
    } else {
      numbers.add(widget.firstNum);
    }
  }

  @override
  void initState() {
    _printNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: numbers.length,
            itemBuilder: (context, index) => Center(
              child: Text(
                numbers[index].toString(),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ));
  }
}
