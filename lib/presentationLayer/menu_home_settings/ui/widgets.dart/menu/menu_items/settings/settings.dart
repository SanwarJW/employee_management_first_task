// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/bloc/menu_bloc.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/menu_items/settings/widgets/dropdown_button.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/menu_items/settings/widgets/setting_card.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>['Top', 'bottom'];

class Settings extends StatelessWidget {
  final String dropdownValueInitial;
  final MenuBloc menuBloc;
  const Settings(
      {super.key, required this.menuBloc, required this.dropdownValueInitial});

  @override
  Widget build(BuildContext context) {
    double desiredItemWidth = 150;
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / desiredItemWidth).floor();
    return Scaffold(
        body: GridView.count(
      crossAxisCount: crossAxisCount,
      children: [
        SettingCard(
          childWidget: MenuDropdownButton(
              menuBloc: menuBloc, dropdownValueInitial: dropdownValueInitial),
        ),
        SettingCard(
          childWidget: MenuDropdownButton(
              menuBloc: menuBloc, dropdownValueInitial: dropdownValueInitial),
        ),
        SettingCard(
          childWidget: MenuDropdownButton(
              menuBloc: menuBloc, dropdownValueInitial: dropdownValueInitial),
        ),
        SettingCard(
          childWidget: MenuDropdownButton(
              menuBloc: menuBloc, dropdownValueInitial: dropdownValueInitial),
        ),
      ],
    ));
  }
}
