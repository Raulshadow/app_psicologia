import 'package:mysql1/mysql1.dart';

class MySql {
  static String host = 'localhost',
                user = 'root',
                password = 'aluno',
                db = 'projeto';
  static int port = 3306;

  MySql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db
    );

    return await MySqlConnection.connect(settings);
  }
}