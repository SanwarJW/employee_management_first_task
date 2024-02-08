// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc_bloc.dart';

abstract class HomeBlocState {}

abstract class HomeBlocActionState extends HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeLoadingState extends HomeBlocState {}

class HomeLoadedSuccessState extends HomeBlocState {
  final List<Employee> developerList;
  final List<Employee> testerList;
  HomeLoadedSuccessState({
    required this.developerList,
    required this.testerList,
  });
}

class HomeErrorState extends HomeBlocState {}

class HomeNavigateToAddPageActionState extends HomeBlocActionState {}

class HomeExpansionPanelListClickedActionState extends HomeBlocActionState {
  final bool developerExpanded;
  final bool testerExpanded;
  HomeExpansionPanelListClickedActionState(
      {required this.developerExpanded, required this.testerExpanded});
}
