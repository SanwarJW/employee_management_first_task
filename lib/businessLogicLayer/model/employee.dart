import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Employee {
  int? id;
  String? firstname;
  String? lastname;
  DateTime? dateOfJoin;
  DateTime? dateOfBirth;
  DateTime? createdDate;
  String? createdBy;
  String? department;
  Employee({
    this.id,
    this.firstname,
    this.lastname,
    this.dateOfJoin,
    this.dateOfBirth,
    this.createdDate,
    this.createdBy,
    this.department,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'dateOfJoin': dateOfJoin?.toIso8601String(),
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'createdDate': createdDate?.toIso8601String(),
      'createdBy': createdBy,
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
      createdDate: map['createdDate'] != null
          ? DateTime.parse(map['createdDate'] as String)
          : null,
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : null,
      department:
          map['department'] != null ? map['department'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) =>
      Employee.fromMap(json.decode(source) as Map<String, dynamic>);
}
