import 'dart:async';

import 'package:bloc/bloc.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuBlocInitialState()) {
    on<MenuMenuBarChangedEvent>(menuMenuBarChangedEvent);
  }

  FutureOr<void> menuMenuBarChangedEvent(
      MenuMenuBarChangedEvent event, Emitter<MenuState> emit) {
    if (event.menuTopOrBottom == 'top') {
      emit(MenuTopMenuState());
    } else {
      emit(MenuBottomMenuState());
    }
  }
}
