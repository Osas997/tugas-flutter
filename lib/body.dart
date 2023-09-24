import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi Flutter"),
        centerTitle: true,
      ),
      body: Center(
        child: const Text(
          "Hello Wolrd",
          style: TextStyle(fontSize: 30, color: Colors.blueAccent),
        ),
      ),
    );
  }
}
