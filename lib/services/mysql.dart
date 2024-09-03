import 'package:mysql1/mysql1.dart';

class MySql {
  static String host = "localhost",
      user = "root",
      password = "David_2002",
      db = "Nectar";
  static int port = 3306;

  MySql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
