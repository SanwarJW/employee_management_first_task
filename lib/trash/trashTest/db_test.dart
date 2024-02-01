import 'package:employee_management_first_task/businessLogicLayer/model/emp_department.dart';
import 'package:employee_management_first_task/businessLogicLayer/model/employee.dart';
import 'package:employee_management_first_task/businessLogicLayer/services/emp_department_services.dart';
import 'package:employee_management_first_task/businessLogicLayer/services/emp_service.dart';
import 'package:employee_management_first_task/dataLayer/repository%20/repository.dart';
import 'package:flutter/material.dart';

class DbTest extends StatefulWidget {
  const DbTest({super.key});

  @override
  State<DbTest> createState() => _DbTestState();
}

class _DbTestState extends State<DbTest> {
  EmpService _empService = EmpService();
  DepartmentServices _departmentServices = DepartmentServices();
  Repository _repository = Repository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExpansionTile(
            title: Text('data'),
            children: [
              Text('data'),
              Text('data'),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                // insertDepData();
                // readDepData();
                // deleteDepData();

                insertEmpData();
                // readEmpData();
                // deleteEmpData();
              },
              child: Text('Button'))
        ],
      )),
    );
  }

  insertDepData() async {
    EmpDepartment value = EmpDepartment(id: 3, departments: 'test');
    var result = await _departmentServices.saveDeportment(value);
    print(result);
  }

  readDepData() async {
    var result = await _departmentServices.readAllDepartment();
    print(result[0].departments);
  }

  deleteDepData() async {
    var result = await _repository.deleteDataById('employeeDepartment', 2);
    print(result);
  }

  insertEmpData() async {
    Employee value = Employee(
        id: 9,
        firstname: 'TESTfirstName',
        lastname: 'TESTlastName',
        dateOfBirth: DateTime.now(),
        dateOfJoin: DateTime(2000, 12, 4),
        department: 'TESTER');
    var result = await _empService.saveEmployee(value);

    print(result);
  }

  readEmpData() async {
    var result = await _empService.readAllEmployees();
    print(result);
  }

  deleteEmpData() async {
    var result = await _repository.deleteDataById('employee', 1);
    print(result);
  }
}
