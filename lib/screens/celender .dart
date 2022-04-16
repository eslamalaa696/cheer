import 'package:cheers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Clender extends StatefulWidget {

  const Clender({Key? key}) : super(key: key);

  @override
  _ClenderState createState() => _ClenderState();
}

class _ClenderState extends State<Clender> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
        ),
        body: Container(
          padding: EdgeInsets.all(22,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              TableCalendar(
                firstDay: kFirstDay,
                lastDay: kLastDay,
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  // Use `selectedDayPredicate` to determine which day is curr
                  // If this returns true, then `day` will be marked as select
                  // Using `isSameDay` is recommended to disregard
                  // the time-part of compared DateTime objects.
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    // Call `setState()` when updating the selected day
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  }
                },
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    // Call `setState()` when updating calendar format
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  // No need to call `setState()` here
                  _focusedDay = focusedDay;
                },

              ),
              SizedBox(height: 44,),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF012A4A),
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
                    ),
                  ),
                ),

                label: Text(" Book     "),
                icon: Icon(Icons.bookmark_add,color:Color(0xFF012A4A), ),
               onPressed: (){
                 {
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                       backgroundColor: Colors.green,
                       content: Text("Booked successfully"),
                     ),
                   );
                 }
                 ;
               },
              ),
            ],
          ),
        ),
      );
  }
}
