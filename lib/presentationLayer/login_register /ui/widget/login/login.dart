import 'package:employee_management_first_task/presentationLayer/login_register%20/bloc/login_register_bloc.dart';
import 'package:employee_management_first_task/presentationLayer/login_register%20/ui/widget/login/login_widget.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final LoginRegisterBloc loginRegisterBloc;
  const Login({super.key, required this.loginRegisterBloc});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height / 1.9,
          left: (MediaQuery.of(context).size.width / 2) - 50,
          child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              )),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 4.5,
          right: MediaQuery.of(context).size.width / 25,
          left: MediaQuery.of(context).size.width / 25,
          child: Container(
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
            child: LoginWidget(loginRegisterBloc: loginRegisterBloc),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.9,
          left: (MediaQuery.of(context).size.width / 2) - 50,
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.amber, Colors.orange]),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        )
      ],
    );
  }
}
