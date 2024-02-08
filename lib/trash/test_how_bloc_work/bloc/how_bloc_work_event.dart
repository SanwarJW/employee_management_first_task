// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'how_bloc_work_bloc.dart';

interface class HowBlocWorkEvent {}

class HowBlocWorkInitialEvent extends HowBlocWorkEvent {}

class HowBlocWorkButtonClickedEvent extends HowBlocWorkEvent {}

class HowBlocWorkBasedOnTheNumberGiveStEvent extends HowBlocWorkEvent {
  int stateNum;
  HowBlocWorkBasedOnTheNumberGiveStEvent({
    required this.stateNum,
  });
}
