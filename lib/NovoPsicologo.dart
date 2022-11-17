import 'package:app_ingresso/logic/mysql.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Novo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Psicólogo"),
      ),
      body: const NovoPsicologo(),
    );
  }
}

class NovoPsicologo extends StatefulWidget {
  const NovoPsicologo({super.key});

  @override
  _NovoPsicologoState createState() => _NovoPsicologoState();
}

class _NovoPsicologoState extends State<NovoPsicologo> {
  final _formKey = GlobalKey<FormState>();
  var db = new Mysql();

  final _primeiroNomeInputController = TextEditingController();
  final _segundoNomeInputController = TextEditingController();
  final _cpfInputController = TextEditingController();
  final _crpInputController = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
            decoration: const InputDecoration(labelText: 'Segudno Nome'),
          ),
          TextFormField(
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

                  String _cpf = _cpfInputController.text;
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
