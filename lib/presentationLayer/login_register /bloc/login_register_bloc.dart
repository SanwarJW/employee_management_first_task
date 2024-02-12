import 'dart:async';

import 'package:bloc/bloc.dart';

part 'login_register_event.dart';
part 'login_register_state.dart';

class LoginRegisterBloc extends Bloc<LoginRegisterEvent, LoginRegisterState> {
  LoginRegisterBloc() : super(LoginRegisterLoginPageState()) {
    on<LoginRegisterChangePageEvent>(loginRegisterChangePageEvent);
  }

  FutureOr<void> loginRegisterChangePageEvent(
      LoginRegisterChangePageEvent event, Emitter<LoginRegisterState> emit) {
    if (event.isLoginPage) {
      emit(LoginRegisterLoginPageState());
    } else {
      emit(LoginRegisterRegisterPageState());
    }
  }
}
