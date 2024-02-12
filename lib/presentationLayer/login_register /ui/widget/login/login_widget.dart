import 'package:employee_management_first_task/presentationLayer/login_register%20/bloc/login_register_bloc.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  final LoginRegisterBloc loginRegisterBloc;
  const LoginWidget({super.key, required this.loginRegisterBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    color: Colors.amber,
                    height: 4,
                    width: 50,
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        loginRegisterBloc.add(
                            LoginRegisterChangePageEvent(isLoginPage: false));
                        print('Register');
                      },
                      child: const Text('REGISTER')),
                ],
              ),
            ],
          ),
        ),
        loginFelid(),
      ],
    );
  }

  loginFelid() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
