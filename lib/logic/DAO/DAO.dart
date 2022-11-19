import 'package:mysql_client/mysql_client.dart';
import 'package:app_ingresso/logic/models/paciente.dart';
import 'package:app_ingresso/logic/models/psicologo.dart';
import 'package:app_ingresso/logic/mysql.dart';
import 'package:flutter/material.dart';

class DAO {
  Mysql db;

  DAO() : db = new Mysql();

  Future<List<Paciente>> getPacientes() async {
    List<Paciente> result = [];

    db.getConnection().then((conn) {
      String sql = 'SELECT * FROM projeto.paciente;';
      conn.execute(sql).then((results) {
        for (var row in results.rows) {
          result.add(new Paciente(
              row.colAt(0) as String,
              int.parse(row.colAt(1) as String),
              row.colAt(2) as String,
              row.colAt(3) as String));
        }
      });
      conn.close();
    });
    return result;
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

    print(cpf);
    String sql =
        "INSERT INTO projeto.paciente (cpf, primeiro_nome, segundo_nome) VALUES ($cpf,'$primeiroNome','$segundoNome');";
    conn.execute(sql).then((result) {
      print(result);
      print('PACIENTE INSERIDO');
    }, onError: (Object error) {
      print(error);
    });
  }

  Future<List<Psicologo>> getPsicologos() async {
    List<Psicologo> result = [];

    db.getConnection().then((conn) {
      String sql = 'SELECT * FROM projeto.pasicologo;';
      conn.execute(sql).then((results) {
        for (var row in results.rows) {
          result.add(new Psicologo(
              row.colAt(0) as String,
              int.parse(row.colAt(1) as String),
              row.colAt(2) as String,
              row.colAt(3) as String,
              row.colAt(4) as String));
        }
      });
      conn.close();
    });
    return result;
  }

  Future<void> insertPsicologo(Psicologo psicologo) async {
    db.getConnection().then((conn) {
      String sql =
          'INSERT INTO projeto.psicologo (crp, cpf, primeiro_nome, segundo_nome) VALUES (:crp,:cpf,:primeiro_nome,:segundo_nome);';
      conn.execute(sql, {
        "crp": psicologo.crp,
        "cpf": psicologo.cpf,
        "primeiro_nome": psicologo.primeiroNome,
        "segundo_nome": psicologo.segundoNome
      }).then((result) {
        print('Psicologo inserido.');
      }, onError: () {
        print('ERRO, PSICOLOGO NÃO INSERIDO');
      });
      conn.close();
    });
  }

  Future<void> insertConsulta(Paciente paciente, Psicologo psicologo) async {
    db.getConnection().then((conn) {
      String sql =
          'INSERT INTO projeto.consulta (Paciente_cpf, Psicologo_crp) VALUES (?,?);';
      conn.execute(sql, {
        "crp": psicologo.crp,
        "cpf": psicologo.cpf,
        "primeiro_nome": psicologo.primeiroNome,
        "segundo_nome": psicologo.segundoNome
      }).then((result) {
        print('Consulta inserida.');
      }, onError: () {
        print('ERRO, CONSULTA NÃO INSERIDA');
      });
      conn.close();
    });
  }
}
