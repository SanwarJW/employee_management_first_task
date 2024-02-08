import 'dart:async';

import 'package:bloc/bloc.dart';

part 'how_bloc_work_event.dart';
part 'how_bloc_work_state.dart';

class HowBlocWorkBloc extends Bloc<HowBlocWorkEvent, HowBlocWorkState> {
  HowBlocWorkBloc() : super(HowBlocWorkBasedOnTheNumberGiveStState()) {
    on<HowBlocWorkInitialEvent>(_howBlocWorkInitialEvent);
    on<HowBlocWorkButtonClickedEvent>(_howBlocWorkButtonClickedEvent);
    on<HowBlocWorkBasedOnTheNumberGiveStEvent>(
        _howBlocWorkBasedOnTheNumberGiveStEvent);
  }

  FutureOr<void> _howBlocWorkInitialEvent(
      HowBlocWorkInitialEvent event, Emitter<HowBlocWorkState> emit) {
    emit(HowBlocWorkInitialState());
  }

  FutureOr<void> _howBlocWorkButtonClickedEvent(
      HowBlocWorkButtonClickedEvent event, Emitter<HowBlocWorkState> emit) {
    emit(HowBlocWorkBasedOnTheNumberGiveStState());
  }

  FutureOr<void> _howBlocWorkBasedOnTheNumberGiveStEvent(
      HowBlocWorkBasedOnTheNumberGiveStEvent event,
      Emitter<HowBlocWorkState> emit) {
    if (event.stateNum == 1) {
      emit(HowBlocWorkInitialState());
    } else {
      emit(HowBlocWorkButtonClickedState());
    }
  }
}
