part of 'menu_bloc.dart';

interface class MenuEvent {}

final class MenuChangeMenuTopBottomEvent extends MenuEvent {
  final String menu;

  MenuChangeMenuTopBottomEvent({required this.menu});
}
