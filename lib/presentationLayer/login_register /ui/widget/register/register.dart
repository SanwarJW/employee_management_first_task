// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:employee_management_first_task/presentationLayer/login_register%20/bloc/login_register_bloc.dart';
import 'package:employee_management_first_task/presentationLayer/login_register%20/ui/widget/register/register_widget.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final LoginRegisterBloc loginRegisterBloc;
  const Register({
    Key? key,
    required this.loginRegisterBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height / 1.50,
          left: (MediaQuery.of(context).size.width / 2) - 50,
          child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.green,
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
            child: RegisterWidget(loginRegisterBloc: loginRegisterBloc),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 1.50,
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
                gradient:
                    const LinearGradient(colors: [Colors.amber, Colors.orange]),
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
