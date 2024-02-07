// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'menu_bloc.dart';

interface class MenuEvent {}

class MenuMenuBarChangedEvent extends MenuEvent {
  String menuTopOrBottom;
  MenuMenuBarChangedEvent({
    required this.menuTopOrBottom,
  });
}
