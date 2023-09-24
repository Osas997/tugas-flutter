import 'package:flutter/material.dart';

class Kolom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi Flutter"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://balaifiksi.com/wp-content/uploads/2023/08/Fakta-Karakter-Gojo-Satoru-di-Jujutsu-Kaisen-8.webp'),
          ],
        ),
      ),
    );
  }
}
