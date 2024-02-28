import 'package:employee_management_first_task/presentationLayer/login_register%20/bloc/login_register_bloc.dart';
import 'package:employee_management_first_task/presentationLayer/login_register%20/ui/widget/login/login.dart';
import 'package:employee_management_first_task/presentationLayer/login_register%20/ui/widget/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginRegister extends StatelessWidget {
  const LoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    LoginRegisterBloc loginRegisterBloc = LoginRegisterBloc();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 238, 236, 236),
      body: Stack(children: [
        Positioned(
          right: 0,
          left: 0,
          height: 350,
          child: Image.asset(fit: BoxFit.cover, 'assets/images/emp.png'),
        ),
        BlocBuilder<LoginRegisterBloc, LoginRegisterState>(
            bloc: loginRegisterBloc,
            buildWhen: (previous, current) =>
                current is! LoginRegisterActionState,
            builder: (context, state) {
              switch (state.runtimeType) {
                case LoginRegisterLoginPageState:
                  return Login(
                    loginRegisterBloc: loginRegisterBloc,
                  );
                case LoginRegisterRegisterPageState:
                  return Register(
                    loginRegisterBloc: loginRegisterBloc,
                  );
                default:
                  return Center(child: const Text('Error'));
              }
            }),
        Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: SizedBox(
              height: 150, //child: Lottie.asset('assets/empWal.json')
            )),
      ]),
    );
  }
}
