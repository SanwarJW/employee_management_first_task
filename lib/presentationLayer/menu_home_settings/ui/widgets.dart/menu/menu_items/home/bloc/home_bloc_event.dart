part of 'home_bloc_bloc.dart';

abstract class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeAddButtonClickedEvent implements HomeBlocEvent {}

class HomeAddButtonNavigateEvent implements HomeBlocEvent {}

class HomeExpansionPanelListClickedEvent implements HomeBlocEvent {
  final bool developerExpanded;
  final bool testerExpanded;
  HomeExpansionPanelListClickedEvent(
      {required this.developerExpanded, required this.testerExpanded});
}
