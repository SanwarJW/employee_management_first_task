// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:employee_management_first_task/presentationLayer/login_register%20/bloc/login_register_bloc.dart';
import 'package:employee_management_first_task/presentationLayer/login_register%20/ui/widget/register/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatelessWidget {
  final LoginRegisterBloc loginRegisterBloc;
  Register({
    Key? key,
    required this.loginRegisterBloc,
  }) : super(key: key);
  String name = '';
  String email = '';
  String password = '';
  String conformPassword = '';
  String authority = '';
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height / 4.5,
          right: MediaQuery.of(context).size.width / 25,
          left: MediaQuery.of(context).size.width / 25,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: RegisterWidget(loginRegisterBloc: loginRegisterBloc),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: BlocListener<LoginRegisterBloc, LoginRegisterState>(
                  listenWhen: (previous, current) =>
                      current is LoginRegisterActionState,
                  bloc: loginRegisterBloc,
                  listener: (context, state) {
                    switch (state.runtimeType) {
                      case LoginRegisterRegisterActionState:
                        LoginRegisterRegisterActionState
                            loginRegisterRegisterActionState =
                            state as LoginRegisterRegisterActionState;
                        name = loginRegisterRegisterActionState.name;
                        email = loginRegisterRegisterActionState.email;
                        password = loginRegisterRegisterActionState.password;
                        conformPassword =
                            loginRegisterRegisterActionState.conformPassword;
                        authority = loginRegisterRegisterActionState.authority;
                        break;
                      default:
                    }
                  },
                  child: GestureDetector(
                    onTap: () {
                      loginRegisterBloc
                          .add(LoginRegisterRegisterPageSubmitEvent(
                        email: email,
                        name: name,
                        password: password,
                        conformPassword: conformPassword,
                        authority: authority,
                      ));
                      print('name $name');
                      print('email $email');
                      print('password $password');
                      print('conformPassword $conformPassword');
                      print('authority $authority');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.amber, Colors.orange]),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
