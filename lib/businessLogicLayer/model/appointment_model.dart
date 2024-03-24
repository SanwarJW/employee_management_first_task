// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class AppointmentData {
  int? id;
  String? startTimeZone;
  String? endTimeZone;
  String? recurrenceRule;
  int? isAllDay;
  String? notes;
  String? location;
  DateTime startTime;
  DateTime endTime;
  String? subject;
  Color? color;
  AppointmentData({
    this.id,
    this.startTimeZone,
    this.endTimeZone,
    this.recurrenceRule,
    this.isAllDay,
    this.notes,
    this.location,
    required this.startTime,
    required this.endTime,
    this.subject,
    this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'startTimeZone': startTimeZone,
      'endTimeZone': endTimeZone,
      'recurrenceRule': recurrenceRule,
      'isAllDay': isAllDay,
      'notes': notes,
      'location': location,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'subject': subject,
      'color': color?.value,
    };
  }

  factory AppointmentData.fromMap(Map<String, dynamic> map) {
    return AppointmentData(
      id: map['id'] != null ? map['id'] as int : null,
      startTimeZone:
          map['startTimeZone'] != null ? map['startTimeZone'] as String : null,
      endTimeZone:
          map['endTimeZone'] != null ? map['endTimeZone'] as String : null,
      recurrenceRule: map['recurrenceRule'] != null
          ? map['recurrenceRule'] as String
          : null,
      isAllDay: map['isAllDay'] != null ? map['isAllDay'] as int : null,
      notes: map['notes'] != null ? map['notes'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      startTime: DateTime.parse(map['startTime'] as String),
      endTime: DateTime.parse(map['endTime'] as String),
      subject: map['subject'] != null ? map['subject'] as String : null,
      color: map['color'] != null ? Color(map['color'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentData.fromJson(String source) =>
      AppointmentData.fromMap(json.decode(source) as Map<String, dynamic>);
}
