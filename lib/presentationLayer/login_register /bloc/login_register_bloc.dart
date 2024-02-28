import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:employee_management_first_task/businessLogicLayer/extension/validater.dart';
import 'package:employee_management_first_task/businessLogicLayer/model/register_model.dart';
import 'package:employee_management_first_task/businessLogicLayer/services/register_services.dart';

part 'login_register_event.dart';
part 'login_register_state.dart';

class LoginRegisterBloc extends Bloc<LoginRegisterEvent, LoginRegisterState> {
  LoginRegisterBloc() : super(LoginRegisterLoginPageState()) {
    on<LoginRegisterChangePageEvent>(loginRegisterChangePageEvent);
    on<LoginRegisterRegisterEvent>(loginRegisterRegisterEvent);
    on<LoginRegisterRegisterPageSubmitEvent>(
        loginRegisterRegisterPageSubmitEvent);
    on<LoginRegisterLoginSubmitEvent>(loginRegisterLoginSubmitEvent);
    on<LoginRegisterLoginEvent>(loginRegisterLoginEvent);
  }
  RegisterService registerService = RegisterService();

  FutureOr<void> loginRegisterChangePageEvent(
      LoginRegisterChangePageEvent event, Emitter<LoginRegisterState> emit) {
    if (event.isLoginPage) {
      emit(LoginRegisterLoginPageState());
    } else {
      emit(LoginRegisterRegisterPageState());
    }
  }

  String? emailRegister = '';
  String? nameRegister = '';
  String? passwordRegister = '';
  String? conformPasswordRegister = '';
  String? authorityRegister = '';
  FutureOr<void> loginRegisterRegisterEvent(
      LoginRegisterRegisterEvent event, Emitter<LoginRegisterState> emit) {
    emailRegister = event.email;
    nameRegister = event.name;
    passwordRegister = event.password;
    conformPasswordRegister = event.conformPassword;
    authorityRegister = event.authority;

    emit(LoginRegisterRegisterActionState(
        name: event.name,
        email: event.email,
        password: event.password,
        conformPassword: event.conformPassword,
        authority: event.authority));
  }

  Future<FutureOr<void>> loginRegisterRegisterPageSubmitEvent(
      LoginRegisterRegisterPageSubmitEvent event,
      Emitter<LoginRegisterState> emit) async {
    emit(
      LoginRegisterRegisterPageErrorMessageActionState(
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
      ),
    );

    if (event.name.isValidFirstName &&
        event.email.isValidEmail &&
        event.password.isValidPassword &&
        event.conformPassword == event.password &&
        event.authority.isNotEmpty) {
      if (await registerService.checkUserExist(event.email)) {
        emit(LoginRegisterRegisterPageErrorMessageActionState(
            emailErrorMassage: 'user already exist'));
      } else {
        final result = await registerService.saveNewUser(RegisterModel(
            name: event.name,
            email: event.email,
            password: event.password,
            authority: event.authority));
        if (result > 0) {
          print('user saved');
          print(result);
          emit(LoginRegisterRegisterPageSuccessNavigationActionState());
        } else {
          print('user not saved');
        }
      }
    }
  }

  String? emailLogin = '';
  String? passwordLogin = '';

  FutureOr<void> loginRegisterLoginEvent(
      LoginRegisterLoginEvent event, Emitter<LoginRegisterState> emit) {
    emailLogin = event.emailMassage;
    passwordLogin = event.passwordMassage;

    emit(
      LoginRegisterLoginMessageActionState(
          email: event.emailMassage, password: event.passwordMassage),
    );
  }

  Future<FutureOr<void>> loginRegisterLoginSubmitEvent(
      LoginRegisterLoginSubmitEvent event,
      Emitter<LoginRegisterState> emit) async {
    print('block login submit event');
    emit(
      LoginRegisterLoginPageErrorMessageActionState(
          emailErrorMassage: event.email.isEmpty
              ? 'email is required'
              : !event.email.isValidEmail
                  ? 'Enter valid email'
                  : '',
          passwordErrorMassage: event.password.isEmpty
              ? 'password is required'
              : !event.password.isValidPassword
                  ? 'Enter valid password'
                  : ''),
    );
    if (event.email.isValidEmail && event.password.isValidPassword) {
      if (await registerService.checkUserExist(event.email)) {
        print('move to menu page');
        emit(LoginRegisterLoginPageSuccessNavigationActionState());
      } else {
        emit(LoginRegisterLoginPageErrorMessageActionState(
            emailErrorMassage: 'user not exist'));
      }
    }
  }
}
