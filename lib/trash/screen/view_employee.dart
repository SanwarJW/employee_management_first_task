// import 'package:employee_management_first_task/model/employee.dart';
// import 'package:flutter/material.dart';

// class ViewEmployee extends StatefulWidget {
//   late final Employee employee;
//   ViewEmployee({super.key, required this.employee});

//   @override
//   State<ViewEmployee> createState() => _ViewEmployeeState();
// }

// class _ViewEmployeeState extends State<ViewEmployee> {
//   @override
//   Widget build(BuildContext context) {
//     String id = widget.employee.id?.toString() ?? 'null';
//     return Scaffold(
//       appBar: AppBar(title: const Text('User details')),
//       body: Container(
//         padding: const EdgeInsets.all(16.0),
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Column(
//                 // mainAxisSize: MainAxisSize.max,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text("User Id $id"),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const Text('Name'),
//                       Text(widget.employee.firstname ?? 'null')
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const Text('Contact'),
//                       Text(widget.employee.lastname ?? 'null')
//                     ],
//                   ),
//                 ],
//               ),
//               const Text('Discription'),
//               Text(widget.employee.deportment ?? 'null'),
//             ]),
//       ),
//     );
//   }
// }
