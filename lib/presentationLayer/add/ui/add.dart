import 'package:date_format_field/date_format_field.dart';
import 'package:employee_management_first_task/presentationLayer/add/bloc/add_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  AddBlocBloc addBlocBloc = AddBlocBloc();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController dateOfBirthDateController = TextEditingController();
  TextEditingController dateOfJoinDateController = TextEditingController();

  DateTime? dateOfBirth;
  DateTime? dateOfJoin;

  bool _validateFirstName = false;
  bool _validateLastName = false;
  bool _validateDateOfBirth = false;
  bool _validateDateOfJoin = false;

  late List<String> _listDepTableDepartment;
  String? selectedValue;
  @override
  void initState() {
    super.initState();
    addBlocBloc.add(AddInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddBlocBloc, AddBlocState>(
      listenWhen: (previous, current) => current is AddBlocActionState,
      buildWhen: (previous, current) => current is! AddBlocActionState,
      bloc: addBlocBloc,
      listener: (context, state) {
        switch (state.runtimeType) {
          case AddValidateFieldsActionState:
            {
              AddValidateFieldsActionState addValidateFieldsState =
                  state as AddValidateFieldsActionState;
              _validateFirstName = addValidateFieldsState.validateFirstName;
              _validateLastName = addValidateFieldsState.validateLastName;
              _validateDateOfBirth = addValidateFieldsState.validateDateOfBirth;
              _validateDateOfBirth = addValidateFieldsState.validateDateOfBirth;
              _validateDateOfJoin = addValidateFieldsState.validateDateOfJoin;
            }
          case AddDropdownEmpItemsActionState:
            {
              AddDropdownEmpItemsActionState addDropdownEmpItemsActionState =
                  state as AddDropdownEmpItemsActionState;
              _listDepTableDepartment =
                  addDropdownEmpItemsActionState.depListOfItems;
              break;
            }
          case AddSaveButtonNavigateState:
            {
              Navigator.pop(context);
            }
          default:
            {}
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case AddLoadingState:
            return Scaffold(
              body: Center(
                child: Lottie.asset('assets/loading.json'),
              ),
            );
          case AddInitialState:
            return Scaffold(
              appBar: AppBar(
                title: const Center(
                  child: Text('add'),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      columnNameContactDescription(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [saveButton(false), clearDetailsButton()],
                      ),
                    ],
                  ),
                ),
              ),
            );

          case AddPageWithSaveButtonState:
            return Scaffold(
              appBar: AppBar(
                title: const Center(
                  child: Text('add'),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      columnNameContactDescription(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          saveButton(true),
                          clearDetailsButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          case AddBlocInitial:
            return const Center(
              child: Text('AddBlocInitial'),
            );
          case AddBlocState:
            return const Center(
              child: Text('AddBlocInitial'),
            );
          default:
            return const Center(
              child: Text('default'),
            );
        }
      },
    );
  }

  Widget clearDetailsButton() {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll<Color?>(Colors.red[300])),
        onPressed: () {
          firstNameController.clear();
          lastNameController.clear();
          departmentController.clear();
          print(dateOfBirthDateController.text);
          dateOfBirthDateController.clear();
          print(dateOfBirthDateController.text);
          dateOfJoinDateController.clear();
          checkTextFieldsFilled();
        },
        child: const Text('Clear Details'));
  }

  final _formKey = GlobalKey<FormState>();
  Widget columnNameContactDescription() {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    Widget column = Form(
      key: _formKey,
      child: SizedBox(
        height: 400,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Add New Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            TextField(
              onChanged: (value) {
                checkTextFieldsFilled();
              },
              controller: firstNameController,
              decoration: InputDecoration(
                hintText: 'Enter First Name',
                labelText: 'FirstName',
                errorText: _validateFirstName ? 'Invalid First Name' : null,
              ),
            ),
            TextField(
              onChanged: (value) {
                checkTextFieldsFilled();
              },
              controller: lastNameController,
              decoration: InputDecoration(
                hintText: 'Enter Last Name',
                labelText: 'LastName',
                errorText: _validateLastName ? 'Invalid Last Name' : null,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: DateFormatField(
                    type: DateFormatType.type2,
                    controller: dateOfBirthDateController,
                    decoration: InputDecoration(
                        errorText:
                            _validateDateOfBirth ? 'Enter a valid date' : null,
                        hintText: formatter.format(DateTime.now())),
                    onComplete: (date) {
                      dateOfBirth = date;
                      checkTextFieldsFilled();
                      print(date.toString);
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DateFormatField(
                      type: DateFormatType.type2,
                      controller: dateOfJoinDateController,
                      decoration: InputDecoration(
                          errorText:
                              _validateDateOfJoin ? 'Enter a valid date' : null,
                          hintText: formatter.format(DateTime.now())),
                      onComplete: (date) {
                        dateOfJoin = date;
                        checkTextFieldsFilled();
                        print('date value');
                        print(formatDate(date!));
                        print('date value after print');
                      }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Select Department',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                DropdownButton<String>(
                  // borderRadius: const BorderRadius.all(Radius.circular(10)),
                  value: selectedValue,
                  hint: const Text('Select Department'),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: _listDepTableDepartment.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    addBlocBloc
                        .add(AddDropdownNewValueEvent(newValue: newValue!));
                    departmentController.text = newValue;
                    checkTextFieldsFilled();
                    selectedValue = newValue;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
    return column;
  }

  checkTextFieldsFilled() {
    addBlocBloc.add(AddTextFieldsFilledEvent(
        nameLen: firstNameController.text.length,
        contactLen: lastNameController.text.length,
        descriptionLen: departmentController.text.length,
        dateOfBirth: dateOfBirthDateController.text.length,
        dateOfJoin: dateOfJoinDateController.text.length));
  }

  saveButton(bool state) {
    if (state) {
      return ElevatedButton(
        onPressed: () {
          addBlocBloc.add(AddValidateFieldsEvent(
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              dateOfBirth: dateOfBirthDateController.text,
              dateOfJoin: dateOfJoinDateController.text));
          addBlocBloc.add(AddSaveButtonClickedEvent(
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              department: departmentController.text,
              dateOfBirth: dateOfBirth!,
              dateOfJoin: dateOfJoin!));
          print('after save button clicked');
        },
        child: const Text('Save Details'),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(
              255, 99, 102, 102), // Set the desired color for the button
        ),
        onPressed: () {},
        child: const Text(
          'Save Details',
          style: TextStyle(
            color: Colors.white, // Set the desired text color
            fontSize: 16.0, // Set the desired font size
            fontWeight: FontWeight.normal, // Set the desired font weight
          ),
        ),
      );
    }
  }

  String formatDate(DateTime date) {
    // Format the DateTime object as a string
    return '${date.year}-${date.month}-${date.day}';
  }
}
