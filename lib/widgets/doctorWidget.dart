// ignore_for_file: file_names,prefer_const_constructors
import 'package:cheers/models/doctor.dart';
import 'package:cheers/screens/doctorScreen.dart';
import 'package:flutter/material.dart';

class DoctorWidget extends StatelessWidget {
  final Doctor doctor;
  const DoctorWidget({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Color.fromRGBO(18, 55, 100, 0.65),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              30,
            ),
            bottomLeft: Radius.circular(
              30,
            ),
            topLeft: Radius.circular(
              30,
            ),
          ),
        ),
        child: SizedBox(
          width: width * 0.9,
          height: height * 0.28,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(
                    doctor.image,
                    height: height * 0.073,
                  ),
                  title: Center(
                    child: Text(
                      "Dr. " + doctor.firstName + " " + doctor.lastName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  isThreeLine: true,
                  subtitle: Column(
                    children: [
                      Text(
                        doctor.company.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (doctor.weight / 10).floor().toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Wrap(
                            children: List<Widget>.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DoctorScreen(doctor: doctor),
                        ),
                      );
                    },
                    child: Container(
                      height: height * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        color: Colors.yellowAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "View\nProfile",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF012A4A),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Specialized in: ",
                  style: TextStyle(
                    shadows: kElevationToShadow[4],
                    color: Colors.blue.shade300,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  children: [
                    TextSpan(
                      text: "Depression, Anxiety",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RichText(
                      text: TextSpan(
                        text: "Session: ",
                        style: TextStyle(
                          shadows: kElevationToShadow[4],
                          color: Colors.blue.shade300,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        children: [
                          TextSpan(
                            text: "${doctor.height} EGP",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size.fromHeight(20),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          30,
                        ),
                        bottomLeft: Radius.circular(
                          30,
                        ),
                      ),
                      side: BorderSide(
                        color: Colors.yellowAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  // foregroundColor: MaterialStateProperty.all(
                  //
                  // ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.3),
                  child: Text(
                    "Book",
                    style: TextStyle(
                      color: Colors.yellowAccent,
                      backgroundColor: Colors.transparent,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Booked successfully"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*

*/
/*

        */
