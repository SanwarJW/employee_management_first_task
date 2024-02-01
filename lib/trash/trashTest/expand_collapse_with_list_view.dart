import 'package:employee_management_first_task/trash/trashTest/datamodel.dart';
import 'package:flutter/material.dart';

class MyAppTest extends StatefulWidget {
  const MyAppTest({super.key});

  @override
  State<MyAppTest> createState() => _MyAppTestState();
}

class _MyAppTestState extends State<MyAppTest> {
  List<Menu> data = [];

  @override
  void initState() {
    for (var element in dataList) {
      data.add(Menu.fromJson(element));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: _drawer(data),
        appBar: AppBar(
          title: const Text('Expandable ListView'),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildList(data[index]),
        ),
      ),
    );
  }

  Widget _drawer(List<Menu> data) {
    return Drawer(
        child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                margin: EdgeInsets.only(bottom: 0.0),
                accountName: Text('demo'),
                accountEmail: Text('demo@webkul.com')),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return _buildList(data[index]);
              },
            )
          ],
        ),
      ),
    ));
  }

  Widget _buildList(Menu list) {
    // if (list.subMenu!.isEmpty) {
    //   print('list is empty');
    //   return Builder(builder: (context) {
    //     return ListTile(
    //         onTap: () {},
    //         leading: const SizedBox(),
    //         title: Text('test data ${list.name!}'));
    //   });
    // }
    return ExpansionTile(
      leading: Icon(list.icon),
      title: Text(
        list.name!,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: list.subMenu!.map(_buildList).toList(),
    );
  }
}
