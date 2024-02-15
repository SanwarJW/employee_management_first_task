part of 'login_register_bloc.dart';

sealed class LoginRegisterState {}

sealed class LoginRegisterActionState extends LoginRegisterState {}

final class LoginRegisterLoginPageState extends LoginRegisterState {}

final class LoginRegisterRegisterPageState extends LoginRegisterState {}

final class LoginRegisterRegisterActionState extends LoginRegisterActionState {
  final String email;
  final String name;
  final String password;
  final String conformPassword;
  final String authority;

  LoginRegisterRegisterActionState({
    required this.email,
    required this.name,
    required this.password,
    required this.conformPassword,
    required this.authority,
  });
}

final class LoginRegisterRegisterPageErrorMessageActionState
    extends LoginRegisterActionState {
  String? emailErrorMassage;
  String? nameErrorMassage;
  String? passwordErrorMassage;
  String? conformPasswordErrorMassage;
  String? authorityErrorMassage;

  LoginRegisterRegisterPageErrorMessageActionState({
    this.emailErrorMassage,
    this.nameErrorMassage,
    this.passwordErrorMassage,
    this.conformPasswordErrorMassage,
    this.authorityErrorMassage,
  });
}
