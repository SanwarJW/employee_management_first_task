part of 'login_register_bloc.dart';

sealed class LoginRegisterEvent {}

final class LoginRegisterChangePageEvent extends LoginRegisterEvent {
  final bool isLoginPage;

  LoginRegisterChangePageEvent({required this.isLoginPage});
}

final class LoginRegisterRegisterEvent extends LoginRegisterEvent {
  final String email;
  final String name;
  final String password;
  final String conformPassword;
  final String authority;

  LoginRegisterRegisterEvent({
    required this.email,
    required this.name,
    required this.password,
    required this.conformPassword,
    required this.authority,
  });
}

final class LoginRegisterRegisterPageSubmitEvent extends LoginRegisterEvent {
  final String email;
  final String name;
  final String password;
  final String conformPassword;
  final String authority;

  LoginRegisterRegisterPageSubmitEvent({
    required this.email,
    required this.name,
    required this.password,
    required this.conformPassword,
    required this.authority,
  });
}
