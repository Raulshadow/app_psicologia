import 'package:app_ingresso/logic/mysql.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditarPaciente extends StatelessWidget {
  final String nome;
  final String segundoNome;
  final String cpf;
  
  const EditarPaciente({super.key, required this.nome, required this.segundoNome, required this.cpf});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Paciente"),
      ),
      body: EditarPacienteForm(nome: nome, cpf: cpf, segundoNome: segundoNome,),
    );
  }
}

class EditarPacienteForm extends StatefulWidget {
  final String nome;
  final String segundoNome;
  final String cpf;
  
   const EditarPacienteForm({super.key, required this.nome, required this.segundoNome, required this.cpf});

  @override
  _EditarPacienteFormState createState() => _EditarPacienteFormState(nome: nome, cpf: cpf, segundoNome: segundoNome,);
}

class _EditarPacienteFormState extends State<EditarPacienteForm> {
  final _formKey = GlobalKey<FormState>();
  var db = Mysql();
  final String? nome;


  _EditarPacienteFormState({required this.nome, required String segundoNome, required String cpf});
  
  final _primeiroNomeInputController = TextEditingController();
  final _segundoNomeInputController = TextEditingController();
  final _cpfInputController = TextEditingController();
  
  get segundoNome => null;
  
  get cpf => null;

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
              },
              child: const Text('Adicionar'),
            ),
          ),
        ],
      ),
    );
  }
}
