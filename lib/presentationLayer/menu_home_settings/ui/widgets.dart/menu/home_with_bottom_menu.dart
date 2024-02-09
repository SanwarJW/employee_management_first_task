import 'package:employee_management_first_task/presentationLayer/menu_home_settings/bloc/menu_bloc.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/menu_items/home/ui/home.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/menu_items/settings/settings.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  final String dropdownValueInitial;
  final MenuBloc menuBloc;
  const HomeBottomBar(
      {super.key, required this.menuBloc, required this.dropdownValueInitial});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarExample(
        menuBloc: menuBloc, dropdownValueInitial: dropdownValueInitial);
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  final String dropdownValueInitial;
  final MenuBloc menuBloc;
  const BottomNavigationBarExample(
      {super.key, required this.menuBloc, required this.dropdownValueInitial});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const Home(),
      Settings(
          menuBloc: widget.menuBloc,
          dropdownValueInitial: widget.dropdownValueInitial),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E M P L O Y E E    L I S T'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5_sharp),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
