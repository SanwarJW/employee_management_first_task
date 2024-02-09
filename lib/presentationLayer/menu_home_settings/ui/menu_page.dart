import 'package:employee_management_first_task/presentationLayer/menu_home_settings/bloc/menu_bloc.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/home_with_bottom_menu.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/home_with_top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

MenuBloc _menuBloc = MenuBloc();

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    initializeSharedPreferences();
    super.initState();
  }

  void initializeSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? menu = prefs.getString('menu');
    _menuBloc.add(MenuChangeMenuTopBottomEvent(menu: menu ?? 'top'));
    // Continue your initialization here
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuBloc, MenuState>(
      bloc: _menuBloc,
      // ignore: unnecessary_type_check
      buildWhen: (previous, current) => current is MenuState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case MenuTopState:
            {
              return HomeWithTopMenu(
                dropdownValueInitial: 'top',
                menuBloc: _menuBloc,
              );
            }

          case MenuBottomState:
            {
              return HomeBottomBar(
                dropdownValueInitial: 'bottom',
                menuBloc: _menuBloc,
              );
            }

          default:
            {
              return Scaffold(
                body: Text('default'),
              );
            }
        }
      },
    );
  }
}
