// Import package yang diperlukan
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// Fungsi main untuk menjalankan aplikasi
void main() => runApp(MyApp());

// URL untuk mengambil data post dari API
String url = "https://jsonplaceholder.typicode.com/posts";

// Fungsi untuk mengambil satu post dari API
Future<List<Post>> fetchPost() async {
  // Mengirimkan permintaan GET ke URL yang ditentukan
  final response = await http.get(Uri.parse(url));

  // Memeriksa apakah kode status respons adalah 200 (HTTP OK)
  if (response.statusCode == 200) {
    // Jika respons berhasil, parse JSON dan kembalikan objek Post
    List<dynamic> body = json.decode(response.body);
    List<Post> posts = body.map((dynamic item) => Post.fromJson(item)).toList();
    return posts;
  } else {
    // Jika respons tidak berhasil, lemparkan pengecualian
    throw Exception('Gagal memuat post');
  }
}

// Kelas Post yang mewakili satu post
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  // Konstruktor untuk membuat objek Post
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Metode pabrik untuk mengonversi data JSON menjadi objek Post
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}

// Kelas MyApp yang mewakili akar dari aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// Kelas MyHomePage yang mewakili konten utama dari aplikasi
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Mengambil satu post saat widget dibuat
  final Future<List<Post>> posts = fetchPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post dari API'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: posts,
          builder: (context, snapshot) {
            // Memeriksa status koneksi dari Future
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Menampilkan indikator loading saat menunggu data
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Menampilkan pesan error jika terjadi kesalahan
              return Text('Error: ${snapshot.error}');
            } else {
              // Menampilkan judul dari post yang diambil
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: ListTile(
                          title: Text(
                            "Title : ${snapshot.data![index].title}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          subtitle:
                              Text("Body : ${snapshot.data![index].body}"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(post: snapshot.data![index]),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Post post;

  DetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Id: ${post.userId}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('ID: ${post.id}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(
              "Title : ${post.title}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text('Body:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
