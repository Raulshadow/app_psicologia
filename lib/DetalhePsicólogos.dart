import 'package:app_ingresso/DetalhePaciente.dart';
import 'package:flutter/material.dart';

import 'DetalhePsicólogos.dart';
import 'NovoPsicologo.dart';
import 'NovaConsulta.dart';

void main() {
  runApp(const MaterialApp(home: DetalhePsicologos()));
}

const pacientes = [
  {
    'nome': 'Jhon Doe',
  },
  {
    'nome': 'Michael',
  },
  {
    'nome': 'Patricia',
  }
];

class DetalhePsicologos extends StatefulWidget {
  const DetalhePsicologos({super.key});

  @override
  _DetalhePsicologos createState() => _DetalhePsicologos();
}

class _DetalhePsicologos extends State<DetalhePsicologos> {
  String? psicologoSelecionado;

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
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: (pacientes.map((paciente) {
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
                                builder: (context) => const DetalhePaciente(
                                      name: 'John Doe',
                                    )));
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue[50]),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
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
                              child: Text(paciente['nome'].toString(),
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
          }).toList())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showRemoveDialog(context);
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _awaitReturnValueFromCategoriasScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DetalhePsicologos()));

    // after the SecondScreen result comes back update the Text widget with it

    if (result == 'cancelar') {
      setState(() {
        psicologoSelecionado = null;
      });
    } else if (result != null) {
      setState(() {
        psicologoSelecionado = result['nome'];
      });
    }
  }
}

_showRemoveDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = ElevatedButton(
    child: const Text("Psicólogo"),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NovoPsicologo()));
    },
  );
  Widget continueButton = ElevatedButton(
    child: const Text("Consulta"),
    onPressed: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NovaConsulta()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Criar novo(a)"),
    actions: [
      cancelButton,
      continueButton,
    ],
    actionsAlignment: MainAxisAlignment.center,
    actionsOverflowButtonSpacing: 10,
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
