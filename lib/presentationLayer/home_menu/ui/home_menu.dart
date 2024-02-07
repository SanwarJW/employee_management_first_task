import 'package:employee_management_first_task/presentationLayer/home/ui/home_with_Top_menu.dart';
import 'package:employee_management_first_task/presentationLayer/home/ui/home_with_bottom.dart';
import 'package:employee_management_first_task/presentationLayer/home_menu/bloc/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

MenuBloc menuBloc = MenuBloc();

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuBloc, MenuState>(
      bloc: menuBloc,
      listenWhen: (previous, current) => current is MenuActionState,
      buildWhen: (previous, current) => current is! MenuActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case MenuTopMenuState:
            print('MenuTopState');
            return const HomeWithTopMenu();

          case MenuBottomMenuState:
            print('MenuBottomState');
            return const HomeBottomBar();

          default:
            return Scaffold();
        }
      },
    );
  }
}

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>['Top', 'bottom'];

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: DropdownButtonExample(),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

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
          menuBloc.add(MenuMenuBarChangedEvent(menuTopOrBottom: 'top'));
          print('top');
        } else if (value == 'bottom') {
          menuBloc.add(MenuMenuBarChangedEvent(menuTopOrBottom: 'bottom'));
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
