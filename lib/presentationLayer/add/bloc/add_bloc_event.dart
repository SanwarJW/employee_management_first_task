part of 'add_bloc_bloc.dart';

abstract class AddBlocEvent {}

final class AddInitialEvent extends AddBlocEvent {}

final class AddTextFieldsFilledEvent extends AddBlocEvent {
  final int nameLen;
  final int contactLen;
  final int descriptionLen;
  final int dateOfBirth;
  final int dateOfJoin;
  AddTextFieldsFilledEvent(
      {required this.nameLen,
      required this.contactLen,
      required this.descriptionLen,
      required this.dateOfBirth,
      required this.dateOfJoin});
}

final class AddValidateFieldsEvent extends AddBlocEvent {
  final String firstName;
  final String lastName;
  final String dateOfJoin;
  final String dateOfBirth;
  AddValidateFieldsEvent(
      {required this.firstName,
      required this.lastName,
      required this.dateOfJoin,
      required this.dateOfBirth});
}

final class AddDropdownNewValueEvent extends AddBlocEvent {
  final String newValue;
  AddDropdownNewValueEvent({required this.newValue});
}

final class AddDropdownEmpItemsEvent extends AddBlocEvent {}

final class AddSaveButtonClickedEvent extends AddBlocEvent {
  final String firstName;
  final String lastName;
  final String department;
  final DateTime dateOfJoin;
  final DateTime dateOfBirth;
  AddSaveButtonClickedEvent(
      {required this.firstName,
      required this.lastName,
      required this.department,
      required this.dateOfJoin,
      required this.dateOfBirth});
}

final class AddSaveButtonNavigateEvent extends AddBlocEvent {}
