part of 'login_register_bloc.dart';

sealed class LoginRegisterEvent {}

final class LoginRegisterChangePageEvent extends LoginRegisterEvent {
  final bool isLoginPage;

  LoginRegisterChangePageEvent({required this.isLoginPage});
}
