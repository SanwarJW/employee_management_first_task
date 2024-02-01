import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:employee_management_first_task/businessLogicLayer/extension/validater.dart';
import 'package:employee_management_first_task/businessLogicLayer/model/employee.dart';
import 'package:employee_management_first_task/businessLogicLayer/services/emp_department_services.dart';
import 'package:employee_management_first_task/businessLogicLayer/services/emp_service.dart';

part 'add_bloc_event.dart';
part 'add_bloc_state.dart';

class AddBlocBloc extends Bloc<AddBlocEvent, AddBlocState> {
  final DepartmentServices _departmentServices = DepartmentServices();
  final EmpService _empService = EmpService();
  bool saveButtonEnabled = false;
  AddBlocBloc() : super(AddBlocInitial()) {
    on<AddInitialEvent>(addInitialEvent);
    on<AddTextFieldsFilledEvent>(addTextFieldsFilledEvent);
    on<AddValidateFieldsEvent>(addValidateFieldsEvent);
    on<AddDropdownNewValueEvent>(addDropdownNewValueEvent);
    on<AddSaveButtonClickedEvent>(addSaveButtonClickedEvent);
  }

  Future<FutureOr<void>> addInitialEvent(
      AddInitialEvent event, Emitter<AddBlocState> emit) async {
    emit(AddLoadingState());
    List<String> depList = await _departmentServices.listDep();

    if (depList.isEmpty) {
      List<String> list = ['null'];

      emit(AddDropdownEmpItemsActionState(
          selectedItem: 'null', depListOfItems: list));
    } else {
      emit(AddDropdownEmpItemsActionState(
          selectedItem: depList[0], depListOfItems: depList));
    }
    emit(AddInitialState());
  }

  FutureOr<void> addTextFieldsFilledEvent(
      AddTextFieldsFilledEvent event, Emitter<AddBlocState> emit) async {
    if (event.nameLen >= 3 &&
        event.contactLen >= 1 &&
        event.descriptionLen >= 1 &&
        event.dateOfBirth >= 1 &&
        event.dateOfJoin >= 1) {
      saveButtonEnabled = true;

      emit(AddPageWithSaveButtonState());
    } else {
      saveButtonEnabled = false;
      emit(AddInitialState());
    }
  }

  FutureOr<void> addValidateFieldsEvent(
      AddValidateFieldsEvent event, Emitter<AddBlocState> emit) {
    emit(AddValidateFieldsActionState(
        validateFirstName: !event.firstName.isValidFirstName,
        validateLastName: !event.lastName.isValidLastName,
        validateDateOfBirth: !event.dateOfBirth.isValidDateDDMMYYYY,
        validateDateOfJoin: !event.dateOfJoin.isValidDateDDMMYYYY));
    emit(AddPageWithSaveButtonState());
  }

  Future<FutureOr<void>> addDropdownNewValueEvent(
      AddDropdownNewValueEvent event, Emitter<AddBlocState> emit) async {
    List<String> depList = await _departmentServices.listDep();
    emit(AddDropdownEmpItemsActionState(
        selectedItem: event.newValue, depListOfItems: depList));
    saveButtonEnabled
        ? emit(AddPageWithSaveButtonState())
        : emit(AddInitialState());
  }

  Future<FutureOr<void>> addSaveButtonClickedEvent(
      AddSaveButtonClickedEvent event, Emitter<AddBlocState> emit) async {
    if (event.firstName.isValidFirstName &&
        event.lastName.isValidLastName &&
        event.department.isNotEmpty &&
        !event.dateOfBirth.toString().isValidDateDDMMYYYY &&
        !event.dateOfJoin.toString().isValidDateDDMMYYYY) {
      var result = await _empService.saveEmployee(Employee(
          firstname: event.firstName,
          lastname: event.lastName,
          dateOfBirth: event.dateOfBirth,
          dateOfJoin: event.dateOfJoin,
          department: event.department));

      print(result);
      emit(AddSaveButtonNavigateState());
    } else {
      print('inside the save clicked event input invalid wrong');
    }

    // emit(AddPageWithSaveButtonState());
  }
}
