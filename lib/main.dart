import 'package:app_ingresso/DetalheConsulta.dart';
import 'package:app_ingresso/DetalhePaciente.dart';
import 'package:app_ingresso/EditarPaciente.dart';
import 'package:app_ingresso/logic/DAO/DAO.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'DetalhePsicólogos.dart';
import 'NovaConsulta.dart';
import 'NovoPaciente.dart';
import 'logic/models/paciente.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dao = new DAO();
  var pacientes = [];
  Future<void> refresh() async {
    var data = await dao.getPacientes();
    setState(() {
      pacientes = data;
    });
  }

  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      print('--> TESTE');
      var data = await dao.getPacientes();
      setState(() {
        pacientes = data;
      });
      print('--> FIM TESTE');
    });
  }

  Widget consultaButtonOnPressed() {
    return FloatingActionButton(
      heroTag: 'btn1',
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NovaConsulta()))
            .then((object) {
          if (object != null) {
            dao.insertConsulta(object);
          }
          refresh();
        });
      },
      backgroundColor: Colors.green,
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            alternarTelaPsicologo(context);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 0.0),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const Text(
              'Psicólogos',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ),
        ),
        actions: <Widget>[
          GestureDetector(
          onTap: () {
            alternarTelaConsulta(context);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(5.0, 15.0, 0.0, 0.0),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const Text(
              'Consultas',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ),
        ),
        ],
        title: const Text('Pacientes'),
        centerTitle: true,
        backgroundColor: Colors.purple[500],
        leadingWidth: 100,
      ),
      body: pacientes != []
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: (pacientes.map((paciente) {
                var nome = paciente.primeiroNome + ' ' + paciente.segundoNome;
                var primeiroNome = paciente.primeiroNome;
                var segundoNome = paciente.segundoNome;
                var cpf = paciente.cpf;
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditarPaciente(
                                          cpf: cpf,
                                          primeiroNome: primeiroNome,
                                          segundoNome: segundoNome,
                                        ))).then((value) => refresh());
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue[50]),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin:
                                const EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.deepPurpleAccent,
                                        width: 1.5,
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blue,
                                          blurRadius: 2,
                                        )
                                      ]),
                                  child: const Image(
                                    image: NetworkImage(
                                        'https://cdn-icons-png.flaticon.com/512/456/456212.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 20, right: 20, top: 10),
                                  child: Text('$nome',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            consultaButtonOnPressed(),
            FloatingActionButton(
              heroTag: 'btn2',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NovoPaciente()))
                    .then((object) {
                  if (object != null) {
                    dao.insertPaciente(object);
                  }
                  refresh();
                });
              },
              backgroundColor: Colors.deepPurpleAccent,
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }

  void alternarTelaPsicologo(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetalhePsicologos()))
        .then((value) => refresh());
  }

  void alternarTelaConsulta(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetalheConsulta()))
        .then((value) => refresh());
  }
}
