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
      required this.cpf});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Paciente"),
      ),
      body: EditarPacienteForm(
        primeiroNome: primeiroNome,
        cpf: cpf,
        segundoNome: segundoNome,
      ),
    );
  }
}

class EditarPacienteForm extends StatefulWidget {
  final String primeiroNome;
  final String segundoNome;
  final String cpf;

  const EditarPacienteForm(
      {super.key,
      required this.primeiroNome,
      required this.segundoNome,
      required this.cpf});

  @override
  _EditarPacienteFormState createState() => _EditarPacienteFormState(
        primeiroNome: primeiroNome,
        cpf: cpf,
        segundoNome: segundoNome,
      );
}

class _EditarPacienteFormState extends State<EditarPacienteForm> {
  final _formKey = GlobalKey<FormState>();
  var db = Mysql();
  final String? primeiroNome;
  final String? segundoNome;
  final String? cpf;

  _EditarPacienteFormState(
      {required this.primeiroNome,
      required this.segundoNome,
      required this.cpf});

  @override
  Widget build(BuildContext context) {
    var dao = DAO();
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
            decoration: const InputDecoration(labelText: 'CPF'),
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
              child: const Text('Adicionar'),
            ),
          ),
        ],
      ),
    );
  }
}
