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
          padding: EdgeInsets.only(left: 11,right: 11,),
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
              SizedBox(height: 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Today",style:TextStyle(fontSize: 20,color: Colors.black),),
                  Text("Tomorrow",style:TextStyle(fontSize: 20,color: Colors.black),),
                  Text("sunday",style:TextStyle(fontSize: 20,color: Colors.black),)
                ],
              ),
              Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 11.0,
                    ),
                    itemCount: 12,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                        padding: EdgeInsets.only(top:9,left: 9, ),
                        // alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Column(children: [Icon(Icons.access_time_filled_sharp,color:Colors.lightBlueAccent ,size:26 ),
                              SizedBox(height: 5,),
                              Text("60",style:TextStyle(fontSize: 18,color: Colors.lightBlueAccent)),
                              SizedBox(height: 2,),
                              Text("Min",style:TextStyle(fontSize: 18,color: Colors.lightBlueAccent),),],),
                            SizedBox(width: 8,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("12:30",style:TextStyle(fontSize: 16,color: Colors.black),),
                                Text("Am",style:TextStyle(fontSize: 16,color: Colors.black),),

                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15)),
                      );
                    }),
              ),

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

                label: Text(" Contiue     "),
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
