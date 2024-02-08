import 'package:employee_management_first_task/presentationLayer/menu_home_settings/bloc/menu_bloc.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/home_with_bottom_menu.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/home_with_top_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

MenuBloc _menuBloc = MenuBloc();

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuBloc, MenuState>(
      bloc: _menuBloc,
      buildWhen: (previous, current) => current is MenuState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case MenuTopState:
            {
              return HomeWithTopMenu(
                menuBloc: _menuBloc,
              );
            }

          case MenuBottomState:
            {
              return HomeBottomBar(
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

  changeMenu(String menu) {
    _menuBloc.add(MenuChangeMenuTopBottomEvent(menu: menu));
  }
}
