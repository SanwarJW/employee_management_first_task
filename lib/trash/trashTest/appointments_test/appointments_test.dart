import 'package:employee_management_first_task/businessLogicLayer/model/appointment_model.dart';
import 'package:employee_management_first_task/businessLogicLayer/services/appointments_services.dart';
import 'package:flutter/material.dart';

class AppointmentsTest extends StatelessWidget {
  AppointmentsTest({super.key});
  AppointmentsServices appointmentsServices = AppointmentsServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // addAppointments();
              allAppointments();
            },
            child: const Text('Test')),
      ),
    );
  }

  addAppointments() async {
    DateTime date = DateTime.now();
    AppointmentData appointmentData = AppointmentData(
      //id: 1,
      startTime: DateTime(date.year, date.month, date.day, 7, 0, 0),
      endTime: DateTime(date.year, date.month, date.day, 11, 0, 0),
      subject: 'Test4',
      // color: Colors.blue
    );
    var result = await appointmentsServices.addAppointment(appointmentData);
    print(result);
  }

  allAppointments() async {
    var result = await appointmentsServices.getAppointments();
    print(result.last.startTime);
  }
}
