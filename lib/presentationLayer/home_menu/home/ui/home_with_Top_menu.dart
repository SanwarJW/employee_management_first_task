import 'package:employee_management_first_task/presentationLayer/home/ui/home.dart';
import 'package:employee_management_first_task/presentationLayer/home_menu/ui/home_menu.dart';
import 'package:flutter/material.dart';

class HomeWithTopMenu extends StatefulWidget {
  const HomeWithTopMenu({super.key});

  @override
  State<HomeWithTopMenu> createState() => _HomeWithTopMenuState();
}

class _HomeWithTopMenuState extends State<HomeWithTopMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: const TabBar(
            tabs: <Widget>[
              // Tab(
              //   icon: Icon(Icons.cloud_outlined),
              // ),
              Tab(
                icon: Icon(Icons.list),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            // Center(
            //   child: Text("It's cloudy here"),
            // ),
            Home(),
            Settings(),
          ],
        ),
      ),
    ));
  }
}
