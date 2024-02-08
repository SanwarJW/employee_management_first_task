import 'dart:async';

import 'package:bloc/bloc.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuTopState()) {
    on<MenuChangeMenuTopBottomEvent>(_menuChangeMenuTopBottomEvent);
  }

  FutureOr<void> _menuChangeMenuTopBottomEvent(
      MenuChangeMenuTopBottomEvent event, Emitter<MenuState> emit) {
    if (event.menu == 'top') {
      emit(MenuTopState());
    } else {
      emit(MenuBottomState());
    }
  }
}
