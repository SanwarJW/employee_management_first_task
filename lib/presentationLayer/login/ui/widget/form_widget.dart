import 'package:employee_management_first_task/presentationLayer/login/ui/widget/login_button_widget.dart';
import 'package:employee_management_first_task/presentationLayer/login/ui/widget/password_field_widget.dart';
import 'package:employee_management_first_task/presentationLayer/login/ui/widget/username_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

final _formKey = GlobalKey<FormState>();

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 250, child: Lottie.asset('assets/Animation.json')),
          const UsernameField(),
          const PasswordField(),
          const SizedBox(height: 15),
          LoginButton(formKey: _formKey),
        ],
      ),
    );
  }
}
