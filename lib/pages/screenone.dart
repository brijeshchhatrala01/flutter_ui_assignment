import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                color: Colors.red,
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: List.generate(
                    4,
                    (index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 75,
                            width: 75,
                            color: Colors.blue,
                          ),
                        )),
              ),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                children: List.generate(
                    9,
                    (index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              height: 60, width: 60, color: Colors.yellow),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
