
import 'package:app_ingresso/logic/models/paciente.dart';
import 'package:app_ingresso/logic/mysql.dart';

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
        print('Paciente inserido.');
      }, onError: () {
        print('ERRO, PACIENTE NÃO INSERIDO');
      });
      conn.close();
    });
  }
}