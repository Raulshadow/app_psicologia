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
        String? cpf = row.colAt(0);//cpf
        int? id = int.parse(row.colAt(1) as String);//id
        String? primeiroNome = row.colAt(2);//primeiro nome
        String? segundoNome = row.colAt(3);//segundo nome

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
}
