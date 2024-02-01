import 'package:employee_management_first_task/businessLogicLayer/model/employee.dart';
import 'package:employee_management_first_task/dataLayer/repository%20/repository.dart';

class EmpService {
  late Repository _repository;
  EmpService() {
    _repository = Repository();
  }
  Future<int> saveEmployee(Employee employee) async {
    int result = await _repository.insertData('employee', employee.toMap());
    return result;
  }

  Future<List<int>> fetchEmployeeWithDepartmentName(
      int id, String firstname, String lastname, String deportmentName) async {
    var result = await _repository.readColumnIdByColumnValue(
        'employeeDepartment', 'departments', deportmentName);
    return result!;
  }

  Future<List<Employee>> readAllEmployees() async {
    final List<Employee> allUsers = [];
    var result = await _repository.readData('employee');
    for (var element in result!) {
      var emp = Employee.fromMap(element);
      allUsers.add(emp);
    }
    return allUsers;
  }

  Future<Map<String, List<Employee>>> filterEmployeesByDepartment() async {
    List<Employee> developers = [];
    List<Employee> testers = [];
    // Fetch all employees
    List<Employee> allEmployees = await readAllEmployees();
    // Filter employees by department
    for (var employee in allEmployees) {
      if (employee.department == 'DEVELOPER') {
        print('DEVELOPER ${employee.department}');
        developers.add(employee);
      } else if (employee.department == 'TESTER') {
        print('TESTER ${employee.department}');
        testers.add(employee);
      }
    }

    return {'developers': developers, 'testers': testers};
  }

  //Edit User
  updateEmployee(Employee employee) async {
    return await _repository.updateData('employee', employee.toMap());
  }

  deleteEmployee(userId) async {
    return await _repository.deleteDataById('employee', userId);
  }

  String formatDate(DateTime date) {
    // Format the DateTime object as a string
    return '${date.year}-${date.month}-${date.day}';
  }
}
