import 'package:employee_management_first_task/presentationLayer/login/bloc/form_submission_status.dart';
import 'package:employee_management_first_task/presentationLayer/login/bloc/login_bloc.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key, required this.formKey}) : super(key: key);

  final dynamic formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formStatus is FormSubmitting
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MenuPage()));
                  // if (formKey.currentState!.validate()) {
                  //   context.read<LoginBloc>().add(LoginSubmitted());
                  // }
                },
                child: const Text('Login'),
              );
      },
    );
  }
}
