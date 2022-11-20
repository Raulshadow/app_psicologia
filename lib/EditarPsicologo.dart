
import 'package:app_ingresso/logic/mysql.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'logic/DAO/DAO.dart';

class EditarPsicologo extends StatelessWidget {
  final String primeiroNome;
  final String segundoNome;
  final String crp;
  final String cpf;

  const EditarPsicologo(
      {super.key,
      required this.primeiroNome,
      required this.segundoNome,
      required this.crp,
      required this.cpf});
  @override

  Widget build(BuildContext context) {
    var dao = DAO();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Psicologo"),
      ),
      body: EditarPsicologoForm(
        primeiroNome: primeiroNome,
        crp: crp,
        segundoNome: segundoNome,
        cpf: cpf,
        dao: dao,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //função para remover psicologo
          _showRemoveDialog(context, dao: dao, crp: crp);

        },
        icon: const Icon(Icons.delete),
        label: const Text('Remover'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class EditarPsicologoForm extends StatefulWidget {
  final String primeiroNome;
  final String segundoNome;
  final String crp;
  final String cpf;
  final DAO dao;

  const EditarPsicologoForm(
      {super.key,
      required this.primeiroNome,
      required this.segundoNome,
      required this.crp,
      required this.cpf,
        required this.dao,
      });

  @override
  _EditarPsicologoFormState createState() => _EditarPsicologoFormState(
      primeiroNome: primeiroNome,
      cpf: cpf,
      crp: crp,
      segundoNome: segundoNome,
      dao: dao
  );
}

class _EditarPsicologoFormState extends State<EditarPsicologoForm> {
  final _formKey = GlobalKey<FormState>();
  var db = Mysql();
  final String? primeiroNome;
  final String? segundoNome;
  final String? cpf;
  final String? crp;

  var dao;

  _EditarPsicologoFormState(
    {required this.primeiroNome,
    required this.segundoNome,
    required this.cpf,
    required this.crp,
    required this.dao});

  @override
  Widget build(BuildContext context) {
    final _primeiroNomeInputController =
    TextEditingController(text: primeiroNome);
    final _segundoNomeInputController =
    TextEditingController(text: segundoNome);
    final _cpfInputController =
    TextEditingController(text: cpf);
    final _crpInputController =
    TextEditingController(text: crp);

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
          TextFormField(
            controller: _crpInputController,
            readOnly: true,
            style: const TextStyle(color: Colors.grey),
            decoration: const InputDecoration(
                labelText: 'CRP', labelStyle: TextStyle(color: Colors.grey)),
          ),
          //botão submit
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                dao.editarPsicologo({
                  'primeiroNome': _primeiroNomeInputController.text,
                  'segundoNome': _segundoNomeInputController.text,
                  'crp': _crpInputController.text
                });
                Navigator.of(context).pop();
              },
              child: const Text('Editar'),
            ),
          ),
        ],
      ),
    );
  }
}

_showRemoveDialog(BuildContext context, {required DAO dao, required String crp}) {
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
      dao.deletarPsicologo({
        'crp': crp,
      });
      Navigator.pop(context);
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Remover Psicologo"),
    content: const Text("Deseja remover o Psicologo?"),
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
