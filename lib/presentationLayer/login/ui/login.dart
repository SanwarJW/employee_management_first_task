import 'package:employee_management_first_task/presentationLayer/login/ui/widget/form_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 172, 224, 241),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: FormWidget(),
      ),
    );
  }
}
