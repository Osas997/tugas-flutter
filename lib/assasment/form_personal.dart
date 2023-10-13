import 'package:flutter/material.dart';
import 'package:tugas_lur/assasment/detail_personal.dart';

class FormBarang extends StatefulWidget {
  const FormBarang({super.key});

  @override
  State<FormBarang> createState() => _FormBarangState();
}

class _FormBarangState extends State<FormBarang> {
  final fullNameTextboxController = TextEditingController();
  final emailTextboxController = TextEditingController();
  final phoneNumberTextboxController = TextEditingController();
  final personalIdNumberTextboxController = TextEditingController();
  final addressTextboxController =
      TextEditingController(); // Ini yang Anda tambahkan

  bool isButtonDisable = true;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.assessment,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DetailPersonalData()));
            },
          )
        ],
        title: const Text(
          "Personal Form",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            formFullName(),
            formEmail(),
            formPhoneNumber(),
            formPersonalIDNumber(),
            formAddress(),
            datePicker(),
            checkbox(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Padding checkbox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Checkbox(
            // Mengatur nilai checkbox
            value: isTrue,
            // Mengatur aksi saat checkbox diubah
            onChanged: (value) {
              setState(() {
                isTrue = !isTrue;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Checkbox is changed'),
                ),
              );
            },
          ),
          SizedBox(width: 8.0), // memberikan sedikit jarak antara Icon dan Text
          Expanded(
            // memastikan teks tidak melebihi batas Row
            child: Text(
              'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
            ),
          ),
        ],
      ),
    );
  }

  Container formFullName() {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 20.0), // Margin kanan kiri dan atas bawah
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: TextField(
        controller: fullNameTextboxController,
        decoration: InputDecoration(
          labelText: 'Full Name', // Label
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Border radius
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Container datePicker() {
    return Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0), // Margin kanan kiri dan atas bawah

        child: TextField(
          keyboardType: TextInputType.datetime,
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2023, 1, 1),
              lastDate: DateTime(2023, 12, 31),
            ).then((date) {
              // Menampilkan tanggal yang dipilih
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(date.toString()),
                ),
              );
            });
          },
          // Mengatur label text field
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: 'SELECT DATE',
            suffixIcon: const Icon(Icons.calendar_today),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ));
  }

  Container formEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 5.0), // Margin kanan kiri dan atas bawah
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: TextField(
        controller: emailTextboxController,
        decoration: InputDecoration(
          labelText: 'Email', // Label
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Border radius
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Row formPhoneNumber() {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              onChanged: (value) {
                if (value != "") {
                  setState(() {
                    isButtonDisable = false;
                  });
                }
              },
              controller: phoneNumberTextboxController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          // Container ini membungkus ElevatedButton
          margin: const EdgeInsets.only(right: 20.0), // Margin di samping kanan
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFF4A3DE5),
              ),
            ),
            onPressed: isButtonDisable ? null : () {},
            child: Text('Verify'),
          ),
        ),
      ],
    );
  }

  Container formPersonalIDNumber() {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 10.0), // Margin kanan kiri dan atas bawah
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: TextField(
        controller: personalIdNumberTextboxController,
        decoration: InputDecoration(
          labelText: 'Personal ID Number', // Label
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Border radius
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Container formAddress() {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 10.0), // Margin kanan kiri dan atas bawah
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: TextField(
        controller: addressTextboxController,
        decoration: InputDecoration(
          labelText: 'Adress', // Label
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Border radius
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  ElevatedButton submitButton() => ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(300, 50)),
          backgroundColor: MaterialStateProperty.all(
            const Color(0xFF4A3DE5),
          )),
      onPressed: () {
        String fullName = fullNameTextboxController.text;
        String email = emailTextboxController.text;
        String phoneNumber = phoneNumberTextboxController.text;
        String personalId = personalIdNumberTextboxController.text;
        String address = addressTextboxController.text;

        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          PersonalData info =
              PersonalData(fullName, email, personalId, phoneNumber, address);
          return DetailPersonalData(
            personalData: info,
          );
        }));
      },
      child: const Text("Submit"));
}
