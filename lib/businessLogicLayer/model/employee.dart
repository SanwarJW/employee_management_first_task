import 'dart:convert';

import 'package:intl/intl.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Employee {
  int? id;
  String? firstname;
  String? lastname;
  DateTime? dateOfJoin;
  DateTime? dateOfBirth;
  String? department;
  Employee({
    this.id,
    this.firstname,
    this.lastname,
    this.dateOfJoin,
    this.dateOfBirth,
    this.department,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'dateOfJoin': DateFormat('yyyy-MM-dd').format(dateOfJoin!),
      'dateOfBirth': DateFormat('yyyy-MM-dd').format(dateOfBirth!),
      'department': department,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    return Employee(
      id: map['id'] != null ? map['id'] as int : null,
      firstname: map['firstname'] != null ? map['firstname'] as String : null,
      lastname: map['lastname'] != null ? map['lastname'] as String : null,
      dateOfJoin: map['dateOfJoin'] != null
          ? DateTime.parse(map['dateOfJoin'] as String)
          : null,
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'] as String)
          : null,
      department:
          map['department'] != null ? map['department'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source) as Map<String, dynamic>);
}
