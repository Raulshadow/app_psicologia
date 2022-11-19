
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
      conn.query(sql).then((results) {
          for(var row in results){
            result.add(
              new Paciente(row[0], row[1], row[2], row[3])
            );
          }
      });
      conn.close();
    });
    return result;
  }

  Future<void> insertPaciente (Paciente paciente) async {
    db.getConnection().then((conn) {
      String sql = 'INSERT INTO projeto.paciente (cpf, primeiro_nome, segundo_nome) VALUES (?,?,?);';
      conn.query(sql,[
        paciente.cpf,
        paciente.primeiroNome,
        paciente.segundoNome
      ]).then((result) {
        AlertDialog(
          title: Text('PACIENTE INSERIDO'),
        );
      }, onError: () {
        print('ERRO, PACIENTE NÃO INSERIDO');
      });
      conn.close();
    });
  }

  Future<List<Psicologo>> getPsicologos() async {
    List<Psicologo> result = [];

    db.getConnection().then((conn) {
      String sql = 'SELECT * FROM projeto.pasicologo;';
      conn.query(sql).then((results) {
        for(var row in results){
          result.add(
              new Psicologo(row[0], row[1], row[2], row[3], row[4])
          );
        }
      });
      conn.close();
    });
    return result;
  }

  Future<void> insertPsicologo (Psicologo psicologo) async {
    db.getConnection().then((conn) {
      String sql = 'INSERT INTO projeto.psicologo (crp, cpf, primeiro_nome, segundo_nome) VALUES (?,?,?,?);';
      conn.query(sql,[
        psicologo.crp,
        psicologo.cpf,
        psicologo.primeiroNome,
        psicologo.segundoNome
      ]).then((result) {
        print('Psicologo inserido.');
      }, onError: () {
        print('ERRO, PSICOLOGO NÃO INSERIDO');
      });
      conn.close();
    });
  }

  Future<void> insertConsulta (Paciente paciente, Psicologo psicologo) async {
    db.getConnection().then((conn) {
      String sql = 'INSERT INTO projeto.consulta (Paciente_cpf, Psicologo_crp) VALUES (?,?);';
      conn.query(sql,[
        paciente.cpf,
        psicologo.crp
      ]).then((result) {
        print('Consulta inserida.');
      }, onError: () {
        print('ERRO, CONSULTA NÃO INSERIDA');
      });
      conn.close();
    });
  }
}