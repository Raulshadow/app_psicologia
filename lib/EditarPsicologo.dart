import 'package:app_ingresso/logic/mysql.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditarPsicologo extends StatelessWidget {
  final String nome;
  final String segundoNome;
  final String crp;
  
  const EditarPsicologo({super.key, required this.nome, required this.segundoNome, required this.crp});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Paciente"),
      ),
      body: EditarPsicologoForm(nome: nome, crp: crp, segundoNome: segundoNome,),
    );
  }
}

class EditarPsicologoForm extends StatefulWidget {
  final String nome;
  final String segundoNome;
  final String crp;
  
   const EditarPsicologoForm({super.key, required this.nome, required this.segundoNome, required this.crp});

  @override
  _EditarPsicologoFormState createState() => _EditarPsicologoFormState(nome: nome, crp: crp, segundoNome: segundoNome,);
}

class _EditarPsicologoFormState extends State<EditarPsicologoForm> {
  final _formKey = GlobalKey<FormState>();
  var db = Mysql();
  final String? nome;

  _EditarPsicologoFormState({required this.nome, required String segundoNome, required String crp});
  
  final _primeiroNomeInputController = TextEditingController();
  final _segundoNomeInputController = TextEditingController();
  final _crpInputController = TextEditingController();
  
  get segundoNome => null;
  
  get crp => null;

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
            initialValue: crp,
            controller: _crpInputController,
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
                  String _crp = _crpInputController.text;
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
