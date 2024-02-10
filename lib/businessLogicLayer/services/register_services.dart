// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:employee_management_first_task/businessLogicLayer/model/register_model.dart';
import 'package:employee_management_first_task/dataLayer/repository%20/repository.dart';

class RegisterService {
  late Repository _repository;
  RegisterService() {
    _repository = Repository();
  }

  Future<int> saveNewUser(RegisterModel user) async {
    return await _repository.insertData('register', user.toMap());
  }

//create a method for chick user is exist or not if exist return user already exist else save user

  Future<RegisterModel?> checkUser(String email) async {
    var result =
        await _repository.readDataByColumnName('register', 'email', email);
    if (result.isNotEmpty) {
      return RegisterModel.fromMap(result.first);
    } else {
      return null;
    }
  }
}
