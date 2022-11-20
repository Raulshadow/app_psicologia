import 'package:mysql_client/mysql_client.dart';
import 'package:app_ingresso/logic/models/paciente.dart';
import 'package:app_ingresso/logic/models/psicologo.dart';
import 'package:app_ingresso/logic/mysql.dart';
import 'package:flutter/material.dart';

class DAO {
  Mysql db;

  DAO() : db = new Mysql();

  Future<List<Paciente>> getPacientes() async {
    List<Paciente> lista = [];
    final conn = await MySQLConnection.createConnection(
      host: db.host,
      port: db.port,
      userName: db.user,
      password: db.password,
      databaseName: db.db,
    );
    await conn.connect();

    String sql = "Select * from projeto.paciente;";
    await conn.execute(sql).then((result) {
      for (var row in result.rows) {
        String? cpf = row.colAt(0); //cpf
        int? id = int.parse(row.colAt(1) as String); //id
        String? primeiroNome = row.colAt(2); //primeiro nome
        String? segundoNome = row.colAt(3); //segundo nome

        Paciente teste = new Paciente(cpf, id, primeiroNome, segundoNome);
        lista.add(teste);
      }

      print('Lista recuperada com sucesso!');
      conn.close();
    }, onError: (Object error) {
      print(error);
    });
    return lista;
  }

  Future<void> insertPaciente(paciente) async {
    final conn = await MySQLConnection.createConnection(
      host: db.host,
      port: db.port,
      userName: db.user,
      password: db.password,
      databaseName: db.db,
    );

    await conn.connect();

    var cpf = paciente['cpf'];
    var primeiroNome = paciente['primeiroNome'];
    var segundoNome = paciente['segundoNome'];

    String sql =
        "INSERT INTO projeto.paciente (cpf, primeiro_nome, segundo_nome) VALUES ($cpf,'$primeiroNome','$segundoNome');";
    conn.execute(sql).then((result) {
      print('PACIENTE INSERIDO');
    }, onError: (Object error) {
      print(error);
    });
  }

  Future<List<Psicologo>> getPsicologos() async {
    List<Psicologo> lista = [];
    final conn = await MySQLConnection.createConnection(
      host: db.host,
      port: db.port,
      userName: db.user,
      password: db.password,
      databaseName: db.db,
    );
    await conn.connect();

    String sql = "Select * from projeto.psicologo;";
    await conn.execute(sql).then((result) {
      for (var row in result.rows) {
        String? crp = row.colAt(0); //crp
        int? id = int.parse(row.colAt(1) as String); //id
        String? cpf = row.colAt(2);
        String? primeiroNome = row.colAt(3); //primeiro nome
        String? segundoNome = row.colAt(4); //segundo nome

        Psicologo teste = new Psicologo(crp, id, cpf, primeiroNome, segundoNome);
        lista.add(teste);
      }

      print('Lista de psicologos recuperada com sucesso!');
      conn.close();
    }, onError: (Object error) {
      print(error);
    });
    return lista;
  }

  Future<void> insertPsicologo(psicologo) async {
    final conn = await MySQLConnection.createConnection(
      host: db.host,
      port: db.port,
      userName: db.user,
      password: db.password,
      databaseName: db.db,
    );

    await conn.connect();

    var crp = psicologo['crp'];
    var cpf = psicologo['cpf'];
    var primeiroNome = psicologo['primeiroNome'];
    var segundoNome = psicologo['segundoNome'];

    String sql =
        "INSERT INTO projeto.psicologo (crp, cpf, primeiro_nome, segundo_nome) VALUES ($crp,$cpf,$primeiroNome,$segundoNome);";
    conn.execute(sql).then((result) {
      print('PSICOLOGO INSERIDO');
    }, onError: (Object error) {
      print(error);
    });
  }

  Future<void> insertConsulta(consulta) async {
    final conn = await MySQLConnection.createConnection(
      host: db.host,
      port: db.port,
      userName: db.user,
      password: db.password,
      databaseName: db.db,
    );

    await conn.connect();

    var cpf = consulta['cpf'];
    var crp = consulta['crp'];

    String sql =
        "INSERT INTO projeto.consulta (Paciente_cpf, Psicologo_crp) VALUES ($cpf,$crp);";
    conn.execute(sql).then((result) {
      print('CONSULTA INSERIDA');
    }, onError: (Object error) {
      print(error);
    });
  }

  Future<void> editarPaciente(paciente) async {
    final conn = await MySQLConnection.createConnection(
      host: db.host,
      port: db.port,
      userName: db.user,
      password: db.password,
      databaseName: db.db,
    );

    await conn.connect();

    var cpf = paciente['cpf'];
    var primeiroNome = paciente['primeiroNome'];
    var segundoNome = paciente['segundoNome'];

    String sql =
        "UPDATE projeto.paciente SET primeiro_nome = '$primeiroNome', segundo_nome = '$segundoNome' WHERE cpf = '$cpf';";
    conn.execute(sql).then((result) {
      print('PACIENTE ALTERADO');
      conn.close();
    }, onError: (Object error) {
      print(error);
    });
  }

  //FALTA EDITAR PSICOLOGO

  Future<void> deletarPaciente(paciente) async {
    final conn = await MySQLConnection.createConnection(
      host: db.host,
      port: db.port,
      userName: db.user,
      password: db.password,
      databaseName: db.db,
    );

    await conn.connect();

    var cpf = paciente['cpf'];

    String sql = "DELETE FROM projeto.paciente WHERE cpf = '$cpf';";
    conn.execute(sql).then((result) {
      print('PACIENTE DELETADO');
      conn.close();
    }, onError: (Object error) {
      print(error);
    });
  }
}
