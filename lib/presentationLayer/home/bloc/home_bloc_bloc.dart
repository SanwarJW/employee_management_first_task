import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:employee_management_first_task/businessLogicLayer/model/employee.dart';
import 'package:employee_management_first_task/businessLogicLayer/services/emp_service.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  EmpService empService = EmpService();
  HomeBlocBloc() : super(HomeLoadingState()) {
    // command by sj
    // on this even(HomeAddButtonClickedEvent) run(homeAddButtonClickedEvent) this function
    on<HomeInitialEvent>(homeInitialEvent);
    // on this even(HomeAddButtonClickedEvent) run(homeAddButtonClickedEvent) this function
    on<HomeAddButtonClickedEvent>(homeAddButtonClickedEvent);
    // on this even(HomeAddButtonNavigateEvent) run(homeAddButtonNavigateEvent) this function
    on<HomeAddButtonNavigateEvent>(homeAddButtonNavigateEvent);
    on<HomeExpansionPanelListClickedEvent>(homeExpansionPanelListClickedEvent);
  }
  Future<FutureOr<void>> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
    Map<String, List<Employee>> departmentMap =
        await empService.filterEmployeesByDepartment();
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        developerList: departmentMap['developers']!,
        testerList: departmentMap['testers']!
        // developerList: await empService.readAllEmployees(),
        // testerList: await empService.readAllEmployees(),
        ));
  }

  FutureOr<void> homeAddButtonClickedEvent(
      HomeAddButtonClickedEvent event, Emitter<HomeBlocState> emit) {
    print('home add button clicked');
  }

  FutureOr<void> homeAddButtonNavigateEvent(
      HomeAddButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    print('home add button Navigate clicked');
    emit(HomeNavigateToAddPageActionState());
  }

  Future<FutureOr<void>> homeExpansionPanelListClickedEvent(
      HomeExpansionPanelListClickedEvent event,
      Emitter<HomeBlocState> emit) async {
    emit(HomeExpansionPanelListClickedActionState(
        developerExpanded: event.developerExpanded,
        testerExpanded: event.testerExpanded));

    Map<String, List<Employee>> departmentMap =
        await empService.filterEmployeesByDepartment();

    emit(HomeLoadedSuccessState(
        developerList: departmentMap['developers']!,
        testerList: departmentMap['testers']!
        // developerList: await empService.readAllEmployees(),
        // testerList: await empService.readAllEmployees(),
        ));
  }
}
