// membuat components chat
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final List<Map<String, dynamic>> dataKantor = [
    {"nama": "Diki Brong", "jabatan": "manager"},
    {"nama": "Elang Brong", "jabatan": "hrd"},
    {"nama": "Fahmi Brong", "jabatan": "backend"},
    {"nama": "Rendi Brong", "jabatan": "frontend"},
    {"nama": "Rafli Brong", "jabatan": "fullstack"},
    {"nama": "Nopal Brong", "jabatan": "db admin"},
    {"nama": "Ardi Brong", "jabatan": "ui ux design"},
    {"nama": "Kemet Brong", "jabatan": "logo designer"},
    {"nama": "Reiki Brong", "jabatan": "hrd"},
    {"nama": "DIka Brong", "jabatan": "staff"},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "List tile",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.home,
                size: 40,
              ),
              Text("Projek Uji Coba"),
              Icon(
                Icons.menu,
                size: 40,
              ),
            ],
          ),
          backgroundColor: Colors.amberAccent,
        ),
        body: ListView(
          children: dataKantor
              .map(
                (data) => Padding(
                  padding: const EdgeInsets.all(2),
                  child: ListTile(
                    // contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    title: Text(data["nama"]),
                    subtitle: Text(data['jabatan']),
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://i0.wp.com/www.rukita.co/stories/wp-content/uploads/2022/04/foto-kucing-oren.jpg?fit=700%2C525&ssl=1'),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
