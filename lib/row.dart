import 'package:flutter/material.dart';

class Roww extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi Flutter"),
        centerTitle: true,
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello Wolrd",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            Text(
              "Hello Wolrd",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
            Text(
              "Hello Wolrd",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
