import 'package:flutter/material.dart';
import 'package:tugas_lur/column.dart';
// import 'package:tugas_lur/body.dart';
// import 'package:tugas_lur/row.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi flutter",
      debugShowCheckedModeBanner: false,
      home: Kolom(),
    );
  }
}
