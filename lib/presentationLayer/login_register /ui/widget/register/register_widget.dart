// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:employee_management_first_task/presentationLayer/login_register%20/bloc/login_register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterWidget extends StatefulWidget {
  final LoginRegisterBloc loginRegisterBloc;
  const RegisterWidget({
    Key? key,
    required this.loginRegisterBloc,
  }) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool radioButtonOne = true;
  bool radioButtonTwo = false;

  GlobalKey _containerKey = GlobalKey();
  double _containerHeight = 0.0;

  String nameErrorMassage = '';
  String emailErrorMassage = '';
  String passwordErrorMassage = '';
  String confirmPasswordErrorMassage = '';
  String authorityErrorMassage = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController authorityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    authorityController.text = 'HR';
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        widget.loginRegisterBloc.add(
                            LoginRegisterChangePageEvent(isLoginPage: true));
                        print('Login');
                      },
                      child: const Text('LOGIN')),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'REGISTER',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    color: Colors.amber,
                    height: 4,
                    width: 70,
                  ),
                ],
              ),
            ],
          ),
        ),
        registerFelid(),
      ],
    );
  }

  registerFelid() {
    return BlocListener<LoginRegisterBloc, LoginRegisterState>(
      bloc: widget.loginRegisterBloc,
      listenWhen: (previous, current) => current is LoginRegisterActionState,
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoginRegisterRegisterPageErrorMessageActionState:
            {
              final actionState =
                  state as LoginRegisterRegisterPageErrorMessageActionState;
              setState(() {
                nameErrorMassage = actionState.nameErrorMassage ?? '';
                emailErrorMassage = actionState.emailErrorMassage ?? '';
                passwordErrorMassage = actionState.passwordErrorMassage ?? '';
                confirmPasswordErrorMassage =
                    actionState.conformPasswordErrorMassage ?? '';
                authorityErrorMassage = actionState.authorityErrorMassage ?? '';
              });
            }
          default:
            break;
        }
      },
      child: Container(
        key: _containerKey,
        margin: const EdgeInsets.all(20),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          _containerHeight = constraints.maxHeight;
          return Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  errorText:
                      nameErrorMassage.isNotEmpty ? nameErrorMassage : null,
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  sendBlocEvent();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  errorText:
                      emailErrorMassage.isNotEmpty ? emailErrorMassage : null,
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  sendBlocEvent();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                onChanged: (value) {
                  sendBlocEvent();
                },
                controller: passwordController,
                decoration: InputDecoration(
                  errorText: passwordErrorMassage.isNotEmpty
                      ? passwordErrorMassage
                      : null,
                  hintText: 'Password',
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
                  sendBlocEvent();
                },
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  errorText: confirmPasswordErrorMassage.isNotEmpty
                      ? confirmPasswordErrorMassage
                      : null,
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.all(15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       GestureDetector(
              //         onTap: () {
              //           authorityController.text = 'HR';
              //           sendBlocEvent();
              //           changeRadioButtonState('HR');
              //         },
              //         child: radioButton(radioButtonOne, 'HR'),
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           authorityController.text = 'IT';
              //           sendBlocEvent();
              //           changeRadioButtonState('IT');
              //         },
              //         child: radioButton(radioButtonTwo, 'IT'),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        }),
      ),
    );
  }

  radioButton(bool select, String title) {
    return Row(
      children: [
        Container(
          child: Icon(Icons.account_circle),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              color: select ? Colors.amber : null,
              borderRadius: BorderRadius.circular(100)),
        ),
        SizedBox(
          width: 10,
        ),
        Text(title)
      ],
    );
  }

  changeRadioButtonState(String title) {
    setState(() {
      if (title == 'HR') {
        radioButtonOne = true;
        radioButtonTwo = false;
      } else {
        radioButtonOne = false;
        radioButtonTwo = true;
      }
    });
  }

  sendBlocEvent() {
    print('height of the container $_containerHeight');
    widget.loginRegisterBloc.add(LoginRegisterRegisterEvent(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        conformPassword: confirmPasswordController.text,
        authority: authorityController.text));
  }
}
