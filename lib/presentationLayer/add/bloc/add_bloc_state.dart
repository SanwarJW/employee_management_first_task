// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_bloc_bloc.dart';

abstract class AddBlocState {}

abstract class AddBlocActionState extends AddBlocState {}

final class AddBlocInitial extends AddBlocState {}

class AddLoadingState extends AddBlocState {}

class AddInitialState extends AddBlocState {}

class AddPageWithSaveButtonState extends AddBlocState {}

class AddValidateFieldsActionState extends AddBlocActionState {
  final bool validateFirstName;
  final bool validateLastName;
  final bool validateDateOfBirth;
  final bool validateDateOfJoin;
  AddValidateFieldsActionState(
      {required this.validateFirstName,
      required this.validateLastName,
      required this.validateDateOfBirth,
      required this.validateDateOfJoin});
}

class AddDropdownEmpItemsActionState extends AddBlocActionState {
  final String? selectedItem;
  final List<String> depListOfItems;
  AddDropdownEmpItemsActionState({
    this.selectedItem,
    required this.depListOfItems,
  });
}

class AddSaveButtonNavigateState extends AddBlocActionState {}
