import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String monthName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfCalendar(
          view: CalendarView.schedule,
          dataSource: MeetingDataSource(getAppointments()),
          scheduleViewMonthHeaderBuilder: (BuildContext buildContext,
              ScheduleViewMonthHeaderDetails details) {
            return Stack(
              children: [
                Image(
                    image: ExactAssetImage('assets/months/' + details.date.month.toString() + '.png'),
                    fit: BoxFit.cover,
                    width: details.bounds.width,
                    height: details.bounds.height),
                Positioned(
                  left: 55,
                  right: 0,
                  top: 20,
                  bottom: 0,
                  child: Text(
                    getName(details.date.month.toString()) + ' ' + details.date.year.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            );
          },
          showDatePickerButton: true
      ),
    );
  }


  String getName(String monthName) {
    if (monthName == "1")
      return monthName = "January";
    else if (monthName == "2") {
      return monthName = "February";
    } else if (monthName == "3") {
      return monthName = "March";
    } else if (monthName == "4") {
      return monthName = "April";
    } else if (monthName == "5") {
      return monthName = "May";
    } else if (monthName == "6") {
      return monthName = "June";
    } else if (monthName == "7") {
      return monthName = "July";
    } else if (monthName == "8") {
      return monthName = "August";
    } else if (monthName == "9") {
      return monthName = "September";
    } else if (monthName == "10") {
      return monthName = "October";
    } else if (monthName == "11") {
      return monthName = "November";
    } else if (monthName == "12") {
      return monthName = "December";
    }
    return "November";
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
  DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Board Meeting',
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      //recurrenceRule: 'FREQ=DAILY;COUNT=2',
      //isAllDay: false
  ));

  meetings.add(Appointment(
    startTime: DateTime(today.year, today.month, 15, 9, 0, 0),
    endTime: startTime.add(const Duration(hours: 2)),
    subject: 'Board Meeting',
    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    //recurrenceRule: 'FREQ=DAILY;COUNT=2',
    //isAllDay: false
  ));

  meetings.add(Appointment(
    startTime: DateTime(today.year, today.month, 16, 9, 0, 0),
    endTime: startTime.add(const Duration(hours: 2)),
    subject: 'Board Meeting',
    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    //recurrenceRule: 'FREQ=DAILY;COUNT=2',
    //isAllDay: false
  ));

  meetings.add(Appointment(
    startTime: DateTime(today.year, today.month, 17, 9, 0, 0),
    endTime: startTime.add(const Duration(hours: 2)),
    subject: 'Board Meeting',
    color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
    //recurrenceRule: 'FREQ=DAILY;COUNT=2',
    //isAllDay: false
  ));

  return meetings;
}

//For Set An Appointment
class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
