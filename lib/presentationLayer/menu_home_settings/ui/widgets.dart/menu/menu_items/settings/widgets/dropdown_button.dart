import 'package:employee_management_first_task/presentationLayer/menu_home_settings/bloc/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuDropdownButton extends StatefulWidget {
  final String dropdownValueInitial;
  final MenuBloc menuBloc;
  const MenuDropdownButton({
    Key? key,
    required this.menuBloc,
    required this.dropdownValueInitial,
  }) : super(key: key);

  @override
  State<MenuDropdownButton> createState() => _MenuDropdownButtonState();
}

const List<String> list = <String>['top', 'bottom'];

class _MenuDropdownButtonState extends State<MenuDropdownButton> {
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.dropdownValueInitial;
  }

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
      onChanged: (String? value) async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        if (value == 'top') {
          widget.menuBloc.add(MenuChangeMenuTopBottomEvent(menu: 'top'));
          await prefs.setString('menu', 'top');
        } else if (value == 'bottom') {
          widget.menuBloc.add(MenuChangeMenuTopBottomEvent(menu: 'bottom'));
          await prefs.setString('menu', 'bottom');
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
