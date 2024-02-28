import 'package:employee_management_first_task/presentationLayer/menu_home_settings/bloc/menu_bloc.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/menu_items/calendar/ui/calendar.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/menu_items/home/ui/home.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/menu_items/settings/settings.dart';
import 'package:flutter/material.dart';

class HomeWithTopMenu extends StatefulWidget {
  final String dropdownValueInitial;
  final MenuBloc menuBloc;
  const HomeWithTopMenu(
      {super.key, required this.menuBloc, required this.dropdownValueInitial});

  @override
  State<HomeWithTopMenu> createState() => _HomeWithTopMenuState();
}

class _HomeWithTopMenuState extends State<HomeWithTopMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('E M P L O Y E E    L I S T'),
          bottom: const TabBar(
            tabs: <Widget>[
              // Tab(
              //   icon: Icon(Icons.cloud_outlined),
              // ),
              Tab(
                icon: Icon(Icons.list),
              ),
              Tab(
                icon: Icon(Icons.calendar_month),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Center(
            //   child: Text("It's cloudy here"),
            // ),
            const Home(),
            Calendar(),
            Settings(
                menuBloc: widget.menuBloc,
                dropdownValueInitial: widget.dropdownValueInitial),
          ],
        ),
      ),
    ));
  }
}
