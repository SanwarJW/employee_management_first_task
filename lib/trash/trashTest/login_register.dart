import 'package:employee_management_first_task/businessLogicLayer/services/register_services.dart';
import 'package:employee_management_first_task/dataLayer/repository%20/repository.dart';
import 'package:flutter/material.dart';

class LoginRegisterTest extends StatelessWidget {
  const LoginRegisterTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Register Test'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                //red();
                chickUser();
              },
              child: Text('red'),
            ),
            ElevatedButton(
              onPressed: () {
                register();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  register() {
    Repository repository = Repository();
    repository.insertData('register',
        {'email': 'sanwar', 'password': 'testPassword', 'authority': 'ok'});
  }

  red() async {
    Repository repository = Repository();
    final result = await repository.readData('register');
    print(result);
  }

  chickUser() async {
    RegisterService loginService = RegisterService();
    var result = await loginService.checkUser('sanwar');
    if (result != null) {
      print(result.id);
    } else {
      print('object is null');
    }
  }
}
