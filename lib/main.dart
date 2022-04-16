// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:cheers/screens/blog.dart';
import 'package:cheers/screens/doctors.dart';
import 'package:cheers/screens/tests.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue.shade900,
        scaffoldBackgroundColor: Colors.blue.shade50,
        primaryTextTheme: ThemeData.light().primaryTextTheme,
        textButtonTheme: ThemeData.light().textButtonTheme,
        textTheme: ThemeData.light().textTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade900),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF012A4A),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool isEng = true;

  static const List<Widget> _pages = <Widget>[
    DoctorsList(),
    Blog(),
    Tests(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kTextTabBarHeight * 1.2),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: ListTile(
                leading: Image.asset(
                  "assets/images/logo.png",
                ),
                title: Text("Nadeen123"),
                trailing: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              isEng
                                  ? Colors.blue.shade400
                                  : Colors.blue.shade900,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isEng = false;
                            });
                          },
                          child: Text("AR"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              isEng
                                  ? Colors.blue.shade900
                                  : Colors.blue.shade400,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isEng = true;
                            });
                          },
                          child: Text("EN"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.health_and_safety),
              label: 'Therapists',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Blog',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pending_actions),
              label: 'Tests',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
