
import 'package:app_ingresso/DetalhePaciente.dart';
import 'package:app_ingresso/EditarPaciente.dart';
import 'package:app_ingresso/logic/DAO/DAO.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'DetalhePsicólogos.dart';
import 'NovoPaciente.dart';
import 'logic/models/paciente.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

const pacientes = [
  {
    'image':
        'https://i.pinimg.com/originals/0d/0d/0d/0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d.jpg',
    'primeiroNome': 'Jhon',
    'segundoNome': 'Doe',
    'cpf': '1',
    'psicologos': ['Adams', 'Clark'],
  },
  {
    'image':
        'https://i.pinimg.com/originals/0d/0d/0d/0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d.jpg',
    'primeiroNome': 'Michael',
    'segundoNome': 'Doe',
    'cpf': '3',
    'psicologos': ['Baker'],
  }
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var dao = new DAO();
  String? psicologoSelecionado;

  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      print('--> TESTE');
      var b = await dao.getPacientes();
      for(var linha in b) {
        print(linha.cpf);
        print(linha.id);
        print(linha.primeiroNome);
        print(linha.segundoNome);
      }
      print('--> FIM TESTE');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            _awaitReturnValueFromCategoriasScreen(context);
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
        title: const Text('Pacientes'),
        centerTitle: true,
        backgroundColor: Colors.purple[500],
        leadingWidth: 100,
      ),
      body: pacientes != []
          ? Column(
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
                                    builder: (context) =>  EditarPaciente(
                                          cpf: paciente['cpf'].toString(), 
                                          primeiroNome: paciente['primeiroNome'].toString(), 
                                          segundoNome: paciente['segundoNome'].toString(),
                                        )));
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
                                  child: Text('${paciente['primeiroNome']} ${paciente['segundoNome']}',
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
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: (pacientes.map((paciente) {
                var psicologosDoPaciente =
                    paciente['psicologos'] as List<String>;
                if (psicologosDoPaciente.contains(psicologoSelecionado)) {
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
                              margin: const EdgeInsets.fromLTRB(
                                  0.0, 5.0, 10.0, 5.0),
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
                                          'https://cdn-icons-png.flaticon.com/512/4406/4406665.png'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15,
                                        bottom: 20,
                                        right: 20,
                                        top: 10),
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
                } else {
                  return Container();
                }
              }).toList())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NovoPaciente()))
              .then((object) {
            if (object != null) {
              dao.insertPaciente(object);
            }
          });
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _awaitReturnValueFromCategoriasScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetalhePsicologos()));

    // after the SecondScreen result comes back update the Text widget with it

    if (result == 'cancelar') {
      setState(() {
        psicologoSelecionado = null;
      });
    } else if (result != null) {
      setState(() {
        psicologoSelecionado = result['primeiroNome'];
      });
    }
  }
}
