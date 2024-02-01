// import 'package:employee_management_first_task/cubit/list_cubit.dart';
// import 'package:employee_management_first_task/model/emp_department.dart';
// import 'package:employee_management_first_task/model/employee.dart';
// import 'package:employee_management_first_task/services/emp_department_services.dart';
// import 'package:employee_management_first_task/services/emp_service.dart';
// import 'package:flutter/material.dart';

// class AddEmployee extends StatefulWidget {
//   const AddEmployee({super.key});

//   @override
//   State<AddEmployee> createState() => _AddEmployeeState();
// }

// class _AddEmployeeState extends State<AddEmployee> {
//   late List<Employee> _listEmp = <Employee>[];
//   late List<String> _items = <String>[];
//   late List<EmpDepartment> _listEmpDep = <EmpDepartment>[];
//   DepartmentServices _deportmentServices = DepartmentServices();
//   EmpService _empService = EmpService();
//   final ListEmpCubit listEmpCubit = ListEmpCubit();

//   @override
//   void initState() {
//     super.initState();
//     // print('start in init');
//     // getAllEmpDepartment();
//     var result = listEmpCubit.listDep;
//     print(result);
//   }

//   getAllEmpDepartment() async {
//     print('start in method');
//     var emp = await _deportmentServices.readAllDepartment();
//     print(emp);
//     for (var element in emp) {
//       _items.add(element.department!);
//     }
//     print('items are created');
//     print(_items);
//     setState(() {
//       _listEmpDep = emp;
//     });
//   }

//   final _empFirstnameController = TextEditingController();
//   final _empLastnameController = TextEditingController();
//   final _empEmailController = TextEditingController();
//   final _empDeportmentController = TextEditingController();

//   bool _validateFirstname = false;
//   bool _validateLastname = false;
//   bool _validateEmail = false;

//   final DepartmentServices _departmentServices = DepartmentServices();

//   // late List<EmpDepartment> _empList;
//   // late List<String> items;

//   getEmpList() async {
//     // var result = await _departmentServices.readAllDepartment();
//     setState(() {
//       // _empList = result;
//     });
//   }

//   // getEmpItems() {
//   //   List<String> list = [];
//   //   for (var element in _empList) {
//   //     list.add(element.department!);
//   //   }
//   //   setState(() {
//   //     items = list;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     String dropdownvalue = 'test';

//     return Scaffold(
//         appBar: AppBar(
//           title: const Center(
//             child: Text('add'),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             height: 500,
//             color: Colors.black26,
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 const Text(
//                   'Edit New Details',
//                   style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 TextField(
//                   controller: _empFirstnameController,
//                   decoration: InputDecoration(
//                     border: const OutlineInputBorder(),
//                     hintText: 'Enter First Name',
//                     labelText: 'First name',
//                     errorText: _validateFirstname
//                         ? 'First Name Value Can\'t Be Empty'
//                         : null,
//                   ),
//                 ),
//                 TextField(
//                   controller: _empLastnameController,
//                   decoration: InputDecoration(
//                     border: const OutlineInputBorder(),
//                     hintText: 'Enter Last Name',
//                     labelText: 'Last Name',
//                     errorText: _validateLastname
//                         ? 'Last Name Value Can\'t Be Empty'
//                         : null,
//                   ),
//                 ),
//                 TextField(
//                   controller: _empEmailController,
//                   decoration: InputDecoration(
//                     border: const OutlineInputBorder(),
//                     hintText: 'Enter Email',
//                     labelText: 'Email',
//                     errorText:
//                         _validateEmail ? 'Email Value Can\'t Be Empty' : null,
//                   ),
//                 ),
//                 Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       // DropdownButton(
//                       //   // Initial Value
//                       //   value: dropdownvalue,

//                       //   // Down Arrow Icon
//                       //   icon: const Icon(Icons.keyboard_arrow_down),

//                       //   // Array list of items
//                       //   items: _items.map((String items) {
//                       //     return DropdownMenuItem(
//                       //       value: items,
//                       //       child: Text(items),
//                       //     );
//                       //   }).toList(),
//                       //   // After selecting the desired option,it will
//                       //   // change button value to selected value
//                       //   onChanged: (String? newValue) {
//                       //     setState(() {
//                       //       dropdownvalue = newValue!;
//                       //     });
//                       //   },
//                       // ),
//                       ElevatedButton(
//                           onPressed: () async {
//                             // EmpDepartment empDepartment = EmpDepartment();
//                             // empDepartment.department = 'Computer science';
//                             // var result = await _departmentServices
//                             //     .saveDeportment(empDepartment);
//                             // print('dep id $result');

//                             // var result =
//                             //     await _departmentServices.readAllDepartment();
//                             // print(result[0].department);

//                             // Employee employee = Employee();
//                             // employee.firstname = 'sanwar';
//                             // employee.lastname = 'sj';
//                             // employee.email = 'sanwarjaysw@gmail.com';
//                             // employee.deportmentId = result[0].id;
//                             // var saveResult =
//                             //     await _empService.saveEmployee(employee);
//                             // print(saveResult);

//                             // var result = await _empService.readAllEmployees();
//                             // print(result[0].deportmentId);
//                           },
//                           child: const Text('Add emp'))
//                     ]),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                         onPressed: () async {
//                           // setState(() {
//                           //   _empFirstnameController.text.isEmpty
//                           //       ? _validateFirstname = true
//                           //       : _validateFirstname = false;
//                           //   _empLastnameController.text.isEmpty
//                           //       ? _validateLastname = true
//                           //       : _validateLastname = false;
//                           //   _empEmailController.text.isEmpty
//                           //       ? _validateEmail = true
//                           //       : _validateEmail = false;
//                           // });
//                           // if (_validateFirstname == false &&
//                           //     _validateLastname == false &&
//                           //     _validateEmail == false) {
//                           //   // print("Good Data Can Save");
//                           //   Employee _emp = Employee();
//                           //   _emp.firstname = _empFirstnameController.text;
//                           //   _emp.lastname = _empLastnameController.text;
//                           //   _emp.email = _empEmailController.text;
//                           //   _emp.deportment =
//                           //       _empDeportmentController.text = dropdownvalue;
//                           //   var result = await _userService.saveEmployee(_emp);
//                           //   print(result);
//                           //   Navigator.pop(context, result);
//                           // }
//                         },
//                         child: const Text('Save Details')),
//                     ElevatedButton(
//                       style: ButtonStyle(
//                           backgroundColor: MaterialStatePropertyAll<Color?>(
//                               Colors.red[300])),
//                       onPressed: () {
//                         // _empFirstnameController.clear();
//                         // _empLastnameController.clear();
//                         // _empEmailController.clear();
//                         // _empDeportmentController.clear();
//                       },
//                       child: const Text('Clear Details'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
