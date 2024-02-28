import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/menu_items/calendar/ui/widget/appointment_builder.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The hove page which hosts the calendar
class Calendar extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const Calendar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    AppointmentBuilderWidget appointmentBuilderWidget =
        AppointmentBuilderWidget();
    return Scaffold(
        body: SfCalendar(
      view: CalendarView.month,
      allowedViews: const <CalendarView>[
        CalendarView.day,
        CalendarView.week,
        CalendarView.workWeek,
        CalendarView.month,
        CalendarView.schedule
      ],
      showDatePickerButton: true,
      showTodayButton: true,
      // allowViewNavigation: true,
      dataSource: appointmentBuilderWidget.getCalendarDataSource(),
      monthViewSettings: const MonthViewSettings(showAgenda: true),
      timeSlotViewSettings:
          const TimeSlotViewSettings(timelineAppointmentHeight: 50),
      appointmentBuilder: appointmentBuilderWidget.appointmentBuilder,
    ));
  }
}
