import 'package:employee_management_first_task/trash/test_how_bloc_work/bloc/how_bloc_work_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HowBlocWork extends StatefulWidget {
  const HowBlocWork({super.key});

  @override
  State<HowBlocWork> createState() => _HowBlocWorkState();
}

class _HowBlocWorkState extends State<HowBlocWork> {
  HowBlocWorkBloc _howBlocWorkBloc = HowBlocWorkBloc();
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HowBlocWorkBloc, HowBlocWorkState>(
      bloc: _howBlocWorkBloc,
      listenWhen: (previous, current) => current is! HowBlocWorkState,
      buildWhen: (previous, current) => current is HowBlocWorkState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HowBlocWorkInitialState:
            print('HowBlocWorkInitialState');
            return Scaffold(
                body: Column(
              children: [
                const Text('HowBlocWorkInitialState'),
                ElevatedButton(
                    onPressed: () {
                      _howBlocWorkBloc.add(HowBlocWorkButtonClickedEvent());
                    },
                    child: Text('change state'))
              ],
            ));
          case HowBlocWorkBasedOnTheNumberGiveStState:
            return Scaffold(
              body: Column(
                children: [
                  TextField(
                    controller: _textEditingController,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _howBlocWorkBloc.add(
                            HowBlocWorkBasedOnTheNumberGiveStEvent(
                                stateNum:
                                    int.parse(_textEditingController.text)));
                      },
                      child: Text('chick the test feald'))
                ],
              ),
            );
          default:
            return Scaffold(body: const Text('default'));
        }
      },
    );
  }
}
