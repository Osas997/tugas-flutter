import 'package:flutter/material.dart';
import 'package:tugas_lur/ui/detail_barang.dart';

class FormBarang extends StatefulWidget {
  const FormBarang({super.key});

  @override
  State<FormBarang> createState() => _FormBarangState();
}

class _FormBarangState extends State<FormBarang> {
  final kodeBarangTextboxController = TextEditingController();
  final namaBarangTextboxController = TextEditingController();
  final hargaBarangTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Tambah Barang"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            formKodeBarang(),
            formNamaBarang(),
            formHargaBarang(),
            submitButton()
          ],
        ),
      ),
    );
  }

  ElevatedButton submitButton() => ElevatedButton(
      onPressed: () {
        String kodeBarang = kodeBarangTextboxController.text;
        String namaBarang = namaBarangTextboxController.text;
        int hargaBarang = int.parse(hargaBarangTextboxController.text);

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailBarang(
                  kodeBarang: kodeBarang,
                  namaBarang: namaBarang,
                  hargaBarang: hargaBarang,
                )));
      },
      child: const Text("Kirim"));

  formKodeBarang() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: const InputDecoration(labelText: "Kode Barang"),
        controller: kodeBarangTextboxController,
      ),
    );
  }

  formNamaBarang() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: const InputDecoration(labelText: "Nama Barang"),
        controller: namaBarangTextboxController,
      ),
    );
  }

  formHargaBarang() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: const InputDecoration(labelText: "Harga Barang"),
        controller: hargaBarangTextboxController,
      ),
    );
  }
}
