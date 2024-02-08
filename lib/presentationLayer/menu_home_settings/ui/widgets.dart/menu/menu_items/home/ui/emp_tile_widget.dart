import 'package:employee_management_first_task/businessLogicLayer/model/employee.dart';
import 'package:flutter/material.dart';

class EmployeeTileWidget extends StatelessWidget {
  final Employee employee;
  const EmployeeTileWidget({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            Text(employee.firstname.toString()),
            Text(employee.lastname.toString()),
          ],
        ),
      ),
    );
  }
}
