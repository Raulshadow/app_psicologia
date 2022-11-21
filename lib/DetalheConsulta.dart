import 'package:app_ingresso/DetalhePaciente.dart';
import 'package:app_ingresso/EditarPsicologo.dart';
import 'package:app_ingresso/logic/DAO/DAO.dart';
import 'package:flutter/material.dart';

import 'DetalhePsicólogos.dart';
import 'NovoPsicologo.dart';
import 'NovaConsulta.dart';

void main() {
  runApp(const MaterialApp(home: DetalheConsulta()));
}

class DetalheConsulta extends StatefulWidget {
  const DetalheConsulta({super.key});

  @override
  _DetalheConsultaState createState() => _DetalheConsultaState();
}

class _DetalheConsultaState extends State<DetalheConsulta> {
  var dao = DAO();
  var consultas = [];
  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    var data = await dao.getConsultas();
    setState(() {
      consultas = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 0.0),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const Text(
              'Pacientes',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ),
        ),
        title: const Text('Consultas'),
        centerTitle: true,
        leadingWidth: 100,
        backgroundColor: Colors.purple[500],
      ),
      body: consultas != []
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: (consultas.map((consulta) {
                var nomePsicologo = consulta.PsiPrimeiroNome + ' ' + consulta.PsiSegundoNome;
                var nomePaciente = consulta.PacPrimeiroNome + ' ' + consulta.PacSegundoNome;
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          border: Border.all(
                            color: Colors.deepPurpleAccent,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () {
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue[50]),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin:
                                const EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2, bottom: 20, right: 2, top: 10),
                                  child: Text('Psicologo: $nomePsicologo, Paciente: $nomePaciente',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList()))
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NovoPsicologo()))
              .then((object) {
            if (object != null) {
              dao.insertPsicologo(object);
            }
            refresh();
          });
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
