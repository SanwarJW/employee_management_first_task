import 'package:employee_management_first_task/businessLogicLayer/model/emp_department.dart';
import 'package:employee_management_first_task/dataLayer/repository%20/repository.dart';

class DepartmentServices {
  late Repository _repository;
  DepartmentServices() {
    _repository = Repository();
  }

  Future<int> saveDeportment(EmpDepartment deportment) async {
    int result =
        await _repository.insertData('employeeDepartment', deportment.toMap());
    return result;
  }

  Future<List<EmpDepartment>> readAllDepartment() async {
    final List<EmpDepartment> allDeportment = [];
    var result = await _repository.readData('employeeDepartment');
    for (var element in result!) {
      var dip = EmpDepartment.fromMap(element);
      allDeportment.add(dip);
    }
    return allDeportment;
  }

  Future<List<String>> listDep() async {
    List<String> result = [];
    var listDep = await readAllDepartment();
    for (var element in listDep) {
      result.add(element.departments!);
    }
    return result;
  }
}
