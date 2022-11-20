import 'package:app_ingresso/DetalhePaciente.dart';
import 'package:app_ingresso/EditarPsicologo.dart';
import 'package:app_ingresso/logic/DAO/DAO.dart';
import 'package:flutter/material.dart';

import 'DetalhePsicólogos.dart';
import 'NovoPsicologo.dart';
import 'NovaConsulta.dart';

void main() {
  runApp(const MaterialApp(home: DetalhePsicologos()));
}

class DetalhePsicologos extends StatefulWidget {
  const DetalhePsicologos({super.key});

  @override
  _DetalhePsicologosState createState() => _DetalhePsicologosState();
}

class _DetalhePsicologosState extends State<DetalhePsicologos> {
  var dao = DAO();
  var psicologos = [];
  void initState() {
    super.initState();
    refresh();
  }

  Future<void> refresh() async {
    var data = await dao.getPsicologos();
    setState(() {
      psicologos = data;
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
        title: const Text('Psicólogos'),
        centerTitle: true,
        leadingWidth: 100,
        backgroundColor: Colors.purple[500],
      ),
      body: psicologos != []
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: (psicologos.map((psicologo) {
                var nome = psicologo.primeiroNome + ' ' + psicologo.segundoNome;
                var primeiroNome = psicologo.primeiroNome;
                var segundoNome = psicologo.segundoNome;
                var cpf = psicologo.cpf;
                var crp = psicologo.crp;
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
                                    builder: (context) => EditarPsicologo(
                                          //checar se é psicologo.atributo ou psicologo['atributo']

                                          crp: crp,
                                          primeiroNome: primeiroNome,
                                          segundoNome: segundoNome,
                                          cpf: cpf,
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
                                        'https://cdn-icons-png.flaticon.com/512/7007/7007423.png'),
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
