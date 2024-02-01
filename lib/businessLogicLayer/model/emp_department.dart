import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class EmpDepartment {
  int? id;
  String? departments;
  EmpDepartment({
    this.id,
    this.departments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'departments': departments,
    };
  }

  factory EmpDepartment.fromMap(Map<String, dynamic> map) {
    return EmpDepartment(
      id: map['id'] != null ? map['id'] as int : null,
      departments:
          map['departments'] != null ? map['departments'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmpDepartment.fromJson(String source) =>
      EmpDepartment.fromMap(json.decode(source) as Map<String, dynamic>);
}
