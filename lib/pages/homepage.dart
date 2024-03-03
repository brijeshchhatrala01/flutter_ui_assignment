import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://storage.googleapis.com/cms-storage-bucket/15ddf26df65cd2f79d6f.jpg',
            width: 150,
            height: 100,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://storage.googleapis.com/cms-storage-bucket/9a56278d6a2ec98e6387.jpg',
                width: 130,
                height: 90,
              ),
              Container(
                color: Colors.blue,
                child: const Text(
                  "Flutter Design",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Image.network(
                'https://storage.googleapis.com/cms-storage-bucket/891abf3d368913fb4b8e.jpg',
                width: 130,
                height: 90,
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Image.network(
            'https://storage.googleapis.com/cms-storage-bucket/acb0587990b4e7890b95.png',
            width: 150,
            height: 100,
          )
        ],
      ),
    );
  }
}
