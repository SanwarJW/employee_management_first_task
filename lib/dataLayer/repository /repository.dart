// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:employee_management_first_task/dataLayer/repository%20/db_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  late DbConnection dbConnection;
  Repository() {
    dbConnection = DbConnection();
  }
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      print('db created');
      return _database;
    } else {
      print('db not created');
      _database = await dbConnection.setDatabase();
      return _database;
    }
  }

  //Insert User
  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  //Read All Record
  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  //Read a Single Record By ID
  readDataById(table, itemId) async {
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  //Read a Single Record By Column
  readDataByColumnName(table, columnName, columnValue) async {
    var connection = await database;
    return await connection
        ?.query(table, where: '$columnName=?', whereArgs: [columnValue]);
  }

  //Update User
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //Delete User
  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection?.rawDelete("delete from $table where id=$itemId");
  }

  // Read Column ID By Column Value
  Future<List<int>?> readColumnIdByColumnValue(
      String table, String columnName, dynamic columnValue) async {
    var connection = await database;
    if (connection != null) {
      List<Map<String, dynamic>> result = await connection.query(
        table,
        columns: ['id'], // Specify the column you want to retrieve
        where: '$columnName=?',
        whereArgs: [columnValue],
      );

      return result.map<int>((row) => row['id'] as int).toList();
    }
    return null;
  }
}
