// import 'dart:async';

// import 'package:bloc/bloc.dart';

// part 'menu_event.dart';
// part 'menu_state.dart';

// class MenuBloc extends Bloc<MenuEvent, MenuState> {
//   MenuBloc() : super(MenuTopState()) {
//     on<MenuButtonClickedEvent>(menuButtonClickedEvent);
//     on<MenuButtonClickedTestEvent>(menuButtonClickedTestEvent);
//   }

//   FutureOr<void> menuButtonClickedEvent(
//       MenuButtonClickedEvent event, Emitter<MenuState> emit) {
//     print('event called');
//     if (event.topOrBottom) {
//       print('top event');
//       emit(MenuTopState());
//     } else if (!event.topOrBottom) {
//       print('bottom event');
//       emit(MenuBottomState());
//     }
//     // emit(MenuBottomState());
//   }

//   FutureOr<void> menuButtonClickedTestEvent(
//       MenuButtonClickedTestEvent event, Emitter<MenuState> emit) {
//     emit(MenuBottomState());
//   }
// }
