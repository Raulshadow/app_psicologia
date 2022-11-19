import 'package:mysql_client/mysql_client.dart';

class Mysql {
   String host = '10.0.2.2',
                user = 'root',
                password = 'admin',
                db = 'projeto';
   int port = 3306;

  Mysql();

  Future<MySQLConnection> getConnection() async {
    var conn = MySQLConnection.createConnection(
        host: host,
        port: port,
        userName: user,
        password: password,
        databaseName: db,
    );

    return conn;
  }
}