import 'package:employee_management_first_task/businessLogicLayer/services/appointments_services.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarData {
  AppointmentDataSource getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];

    AppointmentsServices appointmentsServices = AppointmentsServices();

    appointmentsServices.getAppointments().then((value) {
      value.forEach((element) {
        print(element.startTime);
        appointments.add(Appointment(
          startTime: element.startTime,
          endTime: element.endTime,
          subject: element.subject!,
        ));
      });
    });

    // DateTime date = DateTime.now();
    // appointments.add(
    //   Appointment(
    //     startTime: DateTime(
    //       date.year,
    //       date.month,
    //       date.day,
    //       7,
    //       0,
    //       0,
    //     ),
    //     endTime: DateTime(date.year, date.month, date.day, 11, 0, 0),
    //     // subject: 'Meeting',
    //     // color: Color.fromARGB(255, 209, 242, 23),
    //   ),
    // );

    return AppointmentDataSource(appointments);
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
