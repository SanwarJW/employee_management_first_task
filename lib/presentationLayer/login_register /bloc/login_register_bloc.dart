import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:employee_management_first_task/businessLogicLayer/extension/validater.dart';

part 'login_register_event.dart';
part 'login_register_state.dart';

class LoginRegisterBloc extends Bloc<LoginRegisterEvent, LoginRegisterState> {
  LoginRegisterBloc() : super(LoginRegisterLoginPageState()) {
    on<LoginRegisterChangePageEvent>(loginRegisterChangePageEvent);
    on<LoginRegisterRegisterEvent>(loginRegisterRegisterEvent);
    on<LoginRegisterRegisterPageSubmitEvent>(
        loginRegisterRegisterPageSubmitEvent);
  }

  FutureOr<void> loginRegisterChangePageEvent(
      LoginRegisterChangePageEvent event, Emitter<LoginRegisterState> emit) {
    if (event.isLoginPage) {
      emit(LoginRegisterLoginPageState());
    } else {
      emit(LoginRegisterRegisterPageState());
    }
  }

  String? email = '';
  String? name = '';
  String? password = '';
  String? conformPassword = '';
  String? authority = '';
  FutureOr<void> loginRegisterRegisterEvent(
      LoginRegisterRegisterEvent event, Emitter<LoginRegisterState> emit) {
    email = event.email;
    name = event.name;
    password = event.password;
    conformPassword = event.conformPassword;
    authority = event.authority;

    emit(LoginRegisterRegisterActionState(
        name: event.name,
        email: event.email,
        password: event.password,
        conformPassword: event.conformPassword,
        authority: event.authority));
  }

  FutureOr<void> loginRegisterRegisterPageSubmitEvent(
      LoginRegisterRegisterPageSubmitEvent event,
      Emitter<LoginRegisterState> emit) {
    emit(LoginRegisterRegisterPageErrorMessageActionState(
      nameErrorMassage: event.name.isEmpty
          ? 'name is required'
          : !event.name.isValidFirstName
              ? 'Enter valid name'
              : '',
      emailErrorMassage: event.email.isEmpty
          ? 'email is required'
          : !event.email.isValidEmail
              ? 'Enter valid email'
              : '',
      passwordErrorMassage: event.password.isEmpty
          ? 'password is required'
          : !event.password.isValidPassword
              ? 'Enter valid password'
              : '',
      conformPasswordErrorMassage: event.conformPassword.isEmpty
          ? 'confirm password is required'
          : event.conformPassword != event.password
              ? 'passwords do not match'
              : '',
      authorityErrorMassage:
          event.authority.isEmpty ? 'authority is required' : '',
    ));
  }
}
