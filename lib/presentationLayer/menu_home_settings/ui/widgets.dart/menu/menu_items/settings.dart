// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/bloc/menu_bloc.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['Top', 'bottom'];

class Settings extends StatelessWidget {
  final MenuBloc menuBloc;
  const Settings({super.key, required this.menuBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonExample(menuBloc: menuBloc),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  final MenuBloc menuBloc;
  const DropdownButtonExample({
    Key? key,
    required this.menuBloc,
  }) : super(key: key);

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        if (value == 'Top') {
          widget.menuBloc.add(MenuChangeMenuTopBottomEvent(menu: 'top'));
          print('top');
        } else if (value == 'bottom') {
          widget.menuBloc.add(MenuChangeMenuTopBottomEvent(menu: 'bottom'));
          print('bottom');
        }

        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
