import 'package:mysql_client/mysql_client.dart';

class Mysql {
  String host = 'databaseprojeto.cickhsbfvzrj.us-east-1.rds.amazonaws.com',
      user = 'root',
      password = 'alunobd123.',
      db = 'Projeto';
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
