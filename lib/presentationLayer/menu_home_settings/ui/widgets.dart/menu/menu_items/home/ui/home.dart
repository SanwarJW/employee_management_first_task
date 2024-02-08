import 'package:employee_management_first_task/businessLogicLayer/services/emp_department_services.dart';
import 'package:employee_management_first_task/presentationLayer/add/ui/add.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/menu_items/home/bloc/home_bloc_bloc.dart';
import 'package:employee_management_first_task/presentationLayer/menu_home_settings/ui/widgets.dart/menu/menu_items/home/ui/emp_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBlocBloc.add(HomeInitialEvent());
    super.initState();
  }

  // @override
  // void dispose() {
  //   homeBlocBloc.close();
  //   super.dispose();
  // }

  final HomeBlocBloc homeBlocBloc = HomeBlocBloc();
  final DepartmentServices departmentServices = DepartmentServices();
  bool _developerExpanded = false;
  bool testerExpanded = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBlocBloc,
      listenWhen: (previous, current) => current is HomeBlocActionState,
      buildWhen: (previous, current) => current is! HomeBlocActionState,
      listener: (context, state) {
        print('listener called');

        if (state is HomeNavigateToAddPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPage()));
        } else if (state is HomeExpansionPanelListClickedActionState) {
          HomeExpansionPanelListClickedActionState
              homeExpansionPanelListClickedActionState = state;
          _developerExpanded =
              homeExpansionPanelListClickedActionState.developerExpanded;
          print(_developerExpanded);
          testerExpanded =
              homeExpansionPanelListClickedActionState.testerExpanded;
          print(testerExpanded);
        }
      },
      builder: (context, state) {
        print('home builder called');
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: Lottie.asset('assets/loading.json'),
              ),
            );
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    homeBlocBloc.add(HomeAddButtonNavigateEvent());
                  },
                  child: const Icon(Icons.add)),
              body: Column(
                children: [
                  // ConstrainedBox(
                  //   constraints: const BoxConstraints(maxHeight: 300),
                  //   child: SingleChildScrollView(
                  //     child: ExpansionTile(

                  //       title: const Text('developer'),
                  //       children: List.generate(
                  //         successState.developerList.length,
                  //         (index) => EmployeeTileWidget(
                  //             employee: successState.developerList[index]),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: SingleChildScrollView(
                      child: ExpansionPanelList(
                        expansionCallback: (int index, bool isExpanded) {
                          // setState(() {
                          //   developerExpanded = !developerExpanded;
                          //   testerExpanded = false;
                          // });

                          homeBlocBloc.add(HomeExpansionPanelListClickedEvent(
                              developerExpanded: !_developerExpanded,
                              testerExpanded: false));
                        },
                        children: [
                          ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: const Text('Developer'),
                              );
                            },
                            body: Column(
                              children: List.generate(
                                successState.developerList.length,
                                (index) => EmployeeTileWidget(
                                  employee: successState.developerList[index],
                                ),
                              ),
                            ),
                            isExpanded: _developerExpanded,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ConstrainedBox(
                  //   constraints: const BoxConstraints(maxHeight: 300),
                  //   child: SingleChildScrollView(
                  //     child: ExpansionTile(
                  //       title: const Text('testerList'),
                  //       children: List.generate(
                  //         successState.testerList.length,
                  //         (index) => EmployeeTileWidget(
                  //             employee: successState.testerList[index]),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: SingleChildScrollView(
                      child: ExpansionPanelList(
                        expansionCallback: (int index, bool isExpanded) {
                          // setState(() {
                          //   testerExpanded = !testerExpanded;
                          //   developerExpanded = false;
                          // }
                          // );
                          homeBlocBloc.add(HomeExpansionPanelListClickedEvent(
                              developerExpanded: false,
                              testerExpanded: !testerExpanded));
                        },
                        children: [
                          ExpansionPanel(
                            headerBuilder:
                                (BuildContext context, bool isExpanded) {
                              return ListTile(
                                title: const Text('Tester'),
                              );
                            },
                            body: Column(
                              children: List.generate(
                                successState.testerList.length,
                                (index) => EmployeeTileWidget(
                                  employee: successState.testerList[index],
                                ),
                              ),
                            ),
                            isExpanded: testerExpanded,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );

          default:
            return const Scaffold(
              body: Center(
                child: Text('default'),
              ),
            );
        }
      },
    );
  }
}






// import 'package:employee_management_first_task/businessLogicLayer/services/emp_department_services.dart';
// import 'package:employee_management_first_task/presentationLayer/add/ui/add.dart';
// import 'package:employee_management_first_task/presentationLayer/home/bloc/home_bloc_bloc.dart';
// import 'package:employee_management_first_task/presentationLayer/home/ui/emp_tile_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   void initState() {
//     homeBlocBloc.add(HomeInitialEvent());
//     super.initState();
//   }

//   @override
//   void dispose() {
//     homeBlocBloc.close();
//     super.dispose();
//   }

//   final HomeBlocBloc homeBlocBloc = HomeBlocBloc();
//   final DepartmentServices departmentServices = DepartmentServices();

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeBlocBloc, HomeBlocState>(
//       bloc: homeBlocBloc,
//       listenWhen: (previous, current) => current is HomeBlocActionState,
//       buildWhen: (previous, current) => current is! HomeBlocActionState,
//       listener: (context, state) {
//         print('listener called');

//         if (state is HomeNavigateToAddPageActionState) {
//           Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const AddPage()))
//               .then((value) => homeBlocBloc.add(HomeInitialEvent()));
//         }
//       },
//       builder: (context, state) {
//         print('home builder called');
//         switch (state.runtimeType) {
//           case HomeLoadingState:
//             return const Scaffold(
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           case HomeLoadedSuccessState:
//             final successState = state as HomeLoadedSuccessState;
//             return Scaffold(
//             appBar: AppBar(
//               backgroundColor: const Color.fromARGB(255, 80, 167, 238),
//               title: const Center(
//                 child: Text('Home \n page list of Department'),
//               ),
//             ),
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 homeBlocBloc.add(HomeAddButtonNavigateEvent());
//               },
//               child: const Icon(Icons.add),
//             ),
//             body: SizedBox(
//               height: 500,
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: ExpansionPanelList(
//                         expansionCallback: (int index, bool isExpanded) {
//                           setState(() {
//                             successState.developerList[index].isExpanded =
//                                 !isExpanded;
//                           });
//                         },
//                         children: [
//                           ExpansionPanel(
//                             headerBuilder: (BuildContext context, bool isExpanded) {
//                               return ListTile(
//                                 title: const Text('Developer'),
//                               );
//                             },
//                             body: Column(
//                               children: List.generate(
//                                 successState.developerList.length,
//                                 (index) => EmployeeTileWidget(
//                                   employee: successState.developerList[index],
//                                 ),
//                               ),
//                             ),
//                             isExpanded: successState.developerList.any((developer) => developer.isExpanded),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: ExpansionPanelList(
//                         expansionCallback: (int index, bool isExpanded) {
//                           setState(() {
//                             successState.testerList[index].isExpanded = !isExpanded;
//                           });
//                         },
//                         children: [
//                           ExpansionPanel(
//                             headerBuilder: (BuildContext context, bool isExpanded) {
//                               return ListTile(
//                                 title: const Text('Tester'),
//                               );
//                             },
//                             body: Column(
//                               children: List.generate(
//                                 successState.testerList.length,
//                                 (index) => EmployeeTileWidget(
//                                   employee: successState.testerList[index],
//                                 ),
//                               ),
//                             ),
//                             isExpanded: successState.testerList.any((tester) => tester.isExpanded),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );


//           default:
//             return const Scaffold(
//               body: Center(
//                 child: Text('default'),
//               ),
//             );
//         }
//       },
//     );
//   }

    
// }


