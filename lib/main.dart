import 'package:flutter/material.dart';
import 'package:tugas_lur/assasment/form_personal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Form Data",
        debugShowCheckedModeBanner: false,
        home: FormBarang());
  }
}
