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
                red();
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
    repository.insertData('account',
        {'email': 'sanwar', 'password': 'testPassword', 'authority': 'ok'});
  }

  red() async {
    Repository repository = Repository();
    final result = await repository.readData('account');
    print(result);
  }
}
