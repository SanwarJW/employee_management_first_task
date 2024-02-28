import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarData {
  _AppointmentDataSource getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];

    DateTime date = DateTime.now();

    appointments.add(Appointment(
      startTime: DateTime(
        date.year,
        date.month,
        date.day,
        7,
        0,
        0,
      ),
      endTime: DateTime(date.year, date.month, date.day, 11, 0, 0),
      subject: 'Meeting',
      color: Color.fromARGB(255, 209, 242, 23),
    ));

    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
