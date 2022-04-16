// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables
import 'package:cheers/services/api.dart';
import 'package:cheers/widgets/doctorWidget.dart';
import 'package:flutter/material.dart';

import '../models/doctor.dart';

class DoctorsList extends StatefulWidget {
  const DoctorsList({Key? key}) : super(key: key);

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  final ApiService api = ApiService();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: width * 0.60,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Therapist's Name",
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.30,
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.sort),
                    hintText: "Sort by:",
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder<List<Doctor>>(
            future: api.getDoctors(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Doctor> _doctors = snapshot.data!;
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Doctor _doctor = _doctors[index];
                    return DoctorWidget(doctor: _doctor);
                  },
                  itemCount: _doctors.length,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
