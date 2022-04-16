import 'package:cheers/screens/over_view.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
                  child: Stack(
                    children: [
                      CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/doctor.jpeg",
                              fit: BoxFit.cover,
                              height: 140,
                              width: 140,
                            ),
                          )),
                      Positioned(
                          bottom: 0,
                          right: -20,
                          child: RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Color(0xFFF5F6F9),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.blue,
                            ),
                            padding: EdgeInsets.all(10.0),
                            shape: CircleBorder(),
                          )),
                    ],
                  ),
                ),
              ),
              TextForm(text:"Full Name"),
              TextFormField(
                decoration: (InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                )),
              ),
              SizedBox(height: 11,),
              TextForm(text:"About "),

              TextFormField(
                decoration: (InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                )),
              ), SizedBox(height: 11,),TextForm(text:"Job Name"),
              TextFormField(
                decoration: (InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                )),
              ), SizedBox(height: 11,),TextForm(text:"Country Name"),
              TextFormField(
                decoration: (InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                )),
              ), SizedBox(height: 11,),TextForm(text:"Adress Name"),
              TextFormField(
                decoration: (InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                )),
              ), SizedBox(height: 11,),
              TextForm(text:"Email Name"),
              TextFormField(
                decoration: (InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                )),
              ), SizedBox(height: 11,),
              SizedBox(
                height: 11,
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
                    icon: Icon(Icons.account_box_rounded),
                    label: Text("Done"),
                    onPressed: () {
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text("Edit successfully"),
                          ),
                        );
                      }
                      ;
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

  SizedBox TextForm({required String text}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*.03,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
