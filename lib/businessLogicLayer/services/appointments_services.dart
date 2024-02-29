import 'package:employee_management_first_task/businessLogicLayer/model/appointment_model.dart';
import 'package:employee_management_first_task/dataLayer/repository%20/repository.dart';

class AppointmentsServices extends Repository {
  Future<List<AppointmentData>> getAppointments() async {
    final List<AppointmentData> allAppointment = [];
    var result = await readData('Appointments');
    for (var element in result!) {
      var emp = AppointmentData.fromMap(element);
      allAppointment.add(emp);
    }
    return allAppointment;
  }

  Future<int> addAppointment(AppointmentData appointment) async {
    int result = await insertData('Appointments', appointment.toMap());
    return result;
    // Add appointment to the database
  }

  Future<void> updateAppointment(AppointmentData appointment) async {
    // Update appointment in the database
  }
  Future<void> deleteAppointment(AppointmentData appointment) async {
    // Delete appointment from the database
  }
}
