import 'package:employee_management_first_task/presentationLayer/login_register%20/bloc/login_register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginWidget extends StatefulWidget {
  final LoginRegisterBloc loginRegisterBloc;
  LoginWidget({super.key, required this.loginRegisterBloc});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

String emailErrorMassage = '';
String passwordErrorMassage = '';

class _LoginWidgetState extends State<LoginWidget> {
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
                        widget.loginRegisterBloc.add(
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
    return BlocListener<LoginRegisterBloc, LoginRegisterState>(
      bloc: widget.loginRegisterBloc,
      listenWhen: (previous, current) => current is LoginRegisterActionState,
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoginRegisterLoginPageErrorMessageActionState:
            {
              print('LoginRegisterLoginPageErrorMessageActionState');
              final actionState =
                  state as LoginRegisterLoginPageErrorMessageActionState;
              setState(() {
                emailErrorMassage = actionState.emailErrorMassage!;
                passwordErrorMassage = actionState.passwordErrorMassage!;
              });
            }

            break;

          default:
            break;
        }
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                sendLoginBloc();
              },
              controller: emailController,
              decoration: InputDecoration(
                errorText: emailErrorMassage.isEmpty ? null : emailErrorMassage,
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
              onChanged: (value) {
                sendLoginBloc();
              },
              controller: passwordController,
              decoration: InputDecoration(
                errorText:
                    passwordErrorMassage.isEmpty ? null : passwordErrorMassage,
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
      ),
    );
  }

  sendLoginBloc() {
    print('sendLoginBloc');
    widget.loginRegisterBloc.add(LoginRegisterLoginEvent(
        emailMassage: emailController.text,
        passwordMassage: passwordController.text));
  }
}
