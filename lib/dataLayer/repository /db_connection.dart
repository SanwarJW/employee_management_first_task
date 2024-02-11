import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbConnection {
  Future<Database> setDatabase() async {
    late Database database;
    try {
      var directory = await getApplicationDocumentsDirectory();
      var path = join(directory.path, 'db_employee');
      database =
          await openDatabase(path, version: 1, onCreate: _createDatabase);

      await database.execute("PRAGMA foreign_keys = ON;");
    } on Exception catch (e) {
      print('Something wrong in the onCreate database method $e');
      // Handle the exception appropriately or rethrow it if needed.
      throw e;
    }

    return database;
  }

  _createDatabase(Database database, int version) async {
    // Create the employeeDeportment table
    String employeeDeportmentTableSql =
        'CREATE TABLE employeeDepartment(id INTEGER PRIMARY KEY, departments TEXT unique)';
    await database.execute(employeeDeportmentTableSql);

    // Create the employee table with a foreign key referencing the employeeDeportment table
    String employeeTableSql =
        'CREATE TABLE employee(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT,dateOfBirth DATE, dateOfJoin DATE,createdDate DATE,createdBy TEXT,department TEXT, FOREIGN KEY (department) REFERENCES employeeDepartment(departments)ON DELETE CASCADE ON UPDATE CASCADE)';
    await database.execute(employeeTableSql);

    String loginTableSql =
        'CREATE TABLE register (id INTEGER PRIMARY KEY, email TEXT, password TEXT,authority TEXT)';
    await database.execute(loginTableSql);
  }
}
