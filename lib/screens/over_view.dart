import 'package:cheers/screens/edit_profile.dart';
import 'package:flutter/material.dart';

class OverView extends StatefulWidget {
  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset("assets/images/doctor.jpeg",fit: BoxFit.cover,
                            height: 140,
                            width: 140,),
                      )
                  ),
                ),
              ),
              Center(
                child: Text(
                  "Dr Amira Hassan",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              SizedBox(height: 16,),
              Text(
                "About",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                  "I am a Licensed Clinical Professional Counselor in the state of Kansas and I have over 27 years."),
              SizedBox(
                height: 24,
              ),
              Text(
                "Profile Details",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 18,
              ),
              buildRow(name: "Full Name :", desc: 'Amira Hassan'),
              buildRow(name: "Gender  :", desc: 'Femal'),
              buildRow(name: "Job   :" , desc: 'Psychologist'),
              buildRow(name: "Country  :", desc: 'Egypt'),
              buildRow(name: "Address :", desc: '100 El Tahrir Street'),
              buildRow(name: "Email   :", desc: 'AmiraHassan@gmail.com'),
              SizedBox(
                height: 50,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(right: 20, left: 20),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
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
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF012A4A),
                      ),
                      elevation: MaterialStateProperty.all(
                        12,
                      ),
                    ),
                    icon: Icon(Icons.edit),
                    label: Text("Edit"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditProfile(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
SizedBox buildRow({required String name , required String desc}) {
  return SizedBox(
    height: 33,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.normal,
          ),
        ),

        Center(
          child: Text(
            desc ,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    ),
  );
}