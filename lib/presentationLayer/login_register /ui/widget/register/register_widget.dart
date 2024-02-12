// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:employee_management_first_task/presentationLayer/login_register%20/bloc/login_register_bloc.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  final LoginRegisterBloc loginRegisterBloc;
  RegisterWidget({
    Key? key,
    required this.loginRegisterBloc,
  }) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool radioButtonOne = true;
  bool radioButtonTwo = false;

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
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    changeRadioButtonState('HR');
                  },
                  child: radioButton(radioButtonOne, 'HR'),
                ),
                GestureDetector(
                  onTap: () {
                    changeRadioButtonState('IT');
                  },
                  child: radioButton(radioButtonTwo, 'IT'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
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
}
