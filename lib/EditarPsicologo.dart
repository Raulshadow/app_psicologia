
import 'package:app_ingresso/logic/mysql.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Paciente"),
      ),
      body: EditarPsicologoForm(
        nome: primeiroNome,
        crp: crp,
        segundoNome: segundoNome,
        cpf: cpf,
      ),
    );
  }
}

class EditarPsicologoForm extends StatefulWidget {
  final String nome;
  final String segundoNome;
  final String crp;
  final String cpf;

  const EditarPsicologoForm(
      {super.key,
      required this.nome,
      required this.segundoNome,
      required this.crp,
      required this.cpf});

  @override
  _EditarPsicologoFormState createState() => _EditarPsicologoFormState();
}

class _EditarPsicologoFormState extends State<EditarPsicologoForm> {
  @override
  EditarPsicologoForm get widget => super.widget;

  final _formKey = GlobalKey<FormState>();
  var db = Mysql();

  _EditarPsicologoFormState();

  final _primeiroNomeInputController = TextEditingController();
  final _segundoNomeInputController = TextEditingController();
  final _crpInputController = TextEditingController();
  final _cpfInputController = TextEditingController();

  get nome => widget.nome;
  get segundoNome => widget.segundoNome;
  get crp => widget.crp;
  get cpf => widget.cpf;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            initialValue: nome,
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
            initialValue: segundoNome,
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
            initialValue: cpf,
            controller: _cpfInputController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'CPF'),
          ),
          TextFormField(
            initialValue: crp,
            controller: _crpInputController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'CRP'),
          ),
          //botão submit
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String _crp = _crpInputController.text;
                  String _cpf = _cpfInputController.text;
                  String _primeiroNome = _primeiroNomeInputController.text;
                  String _segundoNome = _segundoNomeInputController.text;

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')));
                }
              },
              child: const Text('Adicionar'),
            ),
          ),
        ],
      ),
    );
  }
}
