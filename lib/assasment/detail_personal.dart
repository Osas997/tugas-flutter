import 'package:flutter/material.dart';

class PersonalData {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? personalIdNumber;
  final String? address;

  const PersonalData(this.fullName, this.email, this.personalIdNumber,
      this.phoneNumber, this.address);
}

class DetailPersonalData extends StatefulWidget {
  final PersonalData? personalData;

  const DetailPersonalData({super.key, this.personalData});

  @override
  State<DetailPersonalData> createState() => _DetailPersonalDataState();
}

class _DetailPersonalDataState extends State<DetailPersonalData> {
  static final List<PersonalData> listData = [];

  @override
  void initState() {
    super.initState();
    if (widget.personalData != null &&
        !listData.contains(widget.personalData)) {
      listData.add(widget.personalData!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          title: const Text(
            "List Personal Data",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )),
        body: ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(height: 10),
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: Container(
                        width: 300,
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listData[index].fullName!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                listData[index].email!,
                              ),
                              SizedBox(height: 10),
                              Text(listData[index].address!),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
