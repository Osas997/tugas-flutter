import 'package:flutter/material.dart';

class DetailBarang extends StatefulWidget {
  final String? kodeBarang;
  final String? namaBarang;
  final int? hargaBarang;

  const DetailBarang(
      {super.key, this.kodeBarang, this.namaBarang, this.hargaBarang});

  @override
  State<DetailBarang> createState() => _DetailBarangState();
}

class _DetailBarangState extends State<DetailBarang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: const Text("Detail Barang"),
        centerTitle: true,
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Kode Barang : ${widget.kodeBarang}"),
            Text("Nama Barang : ${widget.namaBarang}"),
            Text("Harga Barang : ${widget.hargaBarang}"),
          ],
        ),
      ),
    );
  }
}
