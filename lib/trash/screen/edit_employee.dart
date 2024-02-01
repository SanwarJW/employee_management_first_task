// import 'package:employee_management_first_task/model/employee.dart';
// import 'package:employee_management_first_task/services/userService.dart';
// import 'package:flutter/material.dart';

// class EditEmployee extends StatefulWidget {
//   final Employee employee;
//   const EditEmployee({super.key, required this.employee});

//   @override
//   State<EditEmployee> createState() => _EditEmployeeState();
// }

// class _EditEmployeeState extends State<EditEmployee> {
//   final _empFirstnameController = TextEditingController();
//   final _empLastnameController = TextEditingController();
//   final _empEmailController = TextEditingController();
//   final _empDeportmentController = TextEditingController();

//   bool _validateFirstname = false;
//   bool _validateLastname = false;
//   bool _validateEmail = false;
//   bool _validateDeportment = false;

//   final UserService _userService = UserService();

//   @override
//   void initState() {
//     setState(() {
//       _empFirstnameController.text = widget.employee.firstname ?? 'null';
//       _empLastnameController.text = widget.employee.lastname ?? 'null';
//       _empEmailController.text = widget.employee.email ?? 'null';
//       _empDeportmentController.text = widget.employee.deportment ?? 'null';
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Center(
//             child: Text(''),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             height: 400,
//             color: Colors.black26,
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
//                 TextField(
//                   controller: _empDeportmentController,
//                   decoration: InputDecoration(
//                     border: const OutlineInputBorder(),
//                     hintText: 'Enter Deportment',
//                     labelText: 'Deportment',
//                     errorText: _validateDeportment
//                         ? 'Deportment Value Can\'t Be Empty'
//                         : null,
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                         onPressed: () async {
//                           setState(() {
//                             _empFirstnameController.text.isEmpty
//                                 ? _validateFirstname = true
//                                 : _validateFirstname = false;
//                             _empLastnameController.text.isEmpty
//                                 ? _validateLastname = true
//                                 : _validateLastname = false;
//                             _empEmailController.text.isEmpty
//                                 ? _validateEmail = true
//                                 : _validateEmail = false;
//                             _empDeportmentController.text.isEmpty
//                                 ? _validateDeportment = true
//                                 : _validateDeportment = false;
//                           });
//                           if (_validateFirstname == false &&
//                               _validateLastname == false &&
//                               _validateEmail == false &&
//                               _validateDeportment == false) {
//                             // print("Good Data Can Save");
//                             Employee _Employee = Employee();
//                             _Employee.id = widget.employee.id;
//                             _Employee.firstname = _empFirstnameController.text;
//                             _Employee.lastname = _empLastnameController.text;
//                             _Employee.email = _empEmailController.text;
//                             _Employee.deportment =
//                                 _empDeportmentController.text;
//                             var result =
//                                 await _userService.updateEmployee(_Employee);
//                             print(result);
//                             Navigator.pop(context, result);
//                           }
//                         },
//                         child: const Text('Update Details')),
//                     ElevatedButton(
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStatePropertyAll<Color?>(
//                                 Colors.red[300])),
//                         onPressed: () {
//                           _empFirstnameController.clear();
//                           _empLastnameController.clear();
//                           _empEmailController.clear();
//                           _empDeportmentController.clear();
//                         },
//                         child: const Text('Clear Details')),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
