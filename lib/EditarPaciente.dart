import 'package:app_ingresso/logic/mysql.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_ingresso/logic/DAO/DAO.dart';

class EditarPaciente extends StatelessWidget {
  final String primeiroNome;
  final String segundoNome;
  final String cpf;

  const EditarPaciente(
      {super.key,
      required this.primeiroNome,
      required this.segundoNome,
      required this.cpf,});
  @override
  
  Widget build(BuildContext context) {
    var dao = DAO();
    String psicologo_place_holder = 'Sr. Place Holder';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Paciente"),
      ),
      body:
      Column(
        children: [
          EditarPacienteForm(
            primeiroNome: primeiroNome,
            cpf: cpf,
            segundoNome: segundoNome,
            dao: dao,
          ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Text("Psicologo: " + psicologo_place_holder
          )
        )
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //função para remover paciente
          _showRemoveDialog(context, dao: dao, cpf: cpf);

        },
        icon: const Icon(Icons.delete),
        label: const Text('Remover'),
        backgroundColor: Colors.red,
      ),

    );
  }
}

class EditarPacienteForm extends StatefulWidget {
  final String primeiroNome;
  final String segundoNome;
  final String cpf;
  final DAO dao;

  const EditarPacienteForm(
      {super.key,
      required this.primeiroNome,
      required this.segundoNome,
      required this.cpf,
      required this.dao,
      });

  @override
  _EditarPacienteFormState createState() => _EditarPacienteFormState(
        primeiroNome: primeiroNome,
        cpf: cpf,
        segundoNome: segundoNome, 
        dao: dao
      );
}

class _EditarPacienteFormState extends State<EditarPacienteForm> {
  final _formKey = GlobalKey<FormState>();
  var db = Mysql();
  final String? primeiroNome;
  final String? segundoNome;
  final String? cpf;
  
  var dao;

  _EditarPacienteFormState(
      {required this.primeiroNome,
      required this.segundoNome,
      required this.cpf,
      required this.dao});

  @override
  Widget build(BuildContext context) {
    final _primeiroNomeInputController =
        TextEditingController(text: primeiroNome);
    final _segundoNomeInputController =
        TextEditingController(text: segundoNome);
    final _cpfInputController = TextEditingController(text: cpf);
    print(primeiroNome);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _primeiroNomeInputController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Primeiro Nome'),
          ),
          TextFormField(
            controller: _segundoNomeInputController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Segundo Nome'),
          ),
          TextFormField(
            controller: _cpfInputController,
            readOnly: true,
            style: const TextStyle(color: Colors.grey),
            decoration: const InputDecoration(
                labelText: 'CPF', labelStyle: TextStyle(color: Colors.grey)),
          ),
          //botão submit
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String _cpf = _cpfInputController.text;
                  String _primeiroNome = _primeiroNomeInputController.text;
                  String _segundoNome = _segundoNomeInputController.text;

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')));
                }
                dao.editarPaciente({
                  'primeiroNome': _primeiroNomeInputController.text,
                  'segundoNome': _segundoNomeInputController.text,
                  'cpf': _cpfInputController.text
                });
              },
              child: const Text('Editar'),
            ),
          ),
        ],
      ),
    );
  }
}

_showRemoveDialog(BuildContext context, {required DAO dao, required String cpf}) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancelar"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Remover"),
    onPressed: () {
      dao.deletarPaciente({
        'cpf': cpf,
      });
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Remover Paciente"),
    content: const Text("Deseja remover o Paciente?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
