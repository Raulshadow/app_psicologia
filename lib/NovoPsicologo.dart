import 'package:app_ingresso/logic/models/psicologo.dart';
import 'package:app_ingresso/logic/mysql.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'logic/BO/BO.dart';
import 'logic/DAO/DAO.dart';

class NovoPsicologo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Psicólogo"),
      ),
      body: const NovoPsicologoForm(),
    );
  }
}

class NovoPsicologoForm extends StatefulWidget {
  const NovoPsicologoForm({super.key});

  @override
  _NovoPsicologoFormState createState() => _NovoPsicologoFormState();
}

class _NovoPsicologoFormState extends State<NovoPsicologoForm> {
  final _formKey = GlobalKey<FormState>();
  var db = new Mysql();
  var dao = new DAO();

  final _primeiroNomeInputController = TextEditingController();
  final _segundoNomeInputController = TextEditingController();
  final _cpfInputController = TextEditingController();
  final _crpInputController = TextEditingController();

  bool validate1 = true;
  bool validate2 = true;
  bool validate3 = true;
  bool validate4 = true;

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
            decoration: const InputDecoration(labelText: 'Segundo Nome'),
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
                String cpf = _cpfInputController.text;
                String crp = _crpInputController.text;
                String primeiroNome = _primeiroNomeInputController.text;
                String segundoNome = _segundoNomeInputController.text;
                setState(() {
                  isNullOrEmpty(cpf) ? validate1 = false : validate1 = true;
                  isNullOrEmpty(primeiroNome) ? validate2 = false : validate2 = true;
                  isNullOrEmpty(segundoNome) ? validate3 = false : validate3 = true;
                  isNullOrEmpty(crp) ? validate4 = false : validate4 = true;
                });
                if(validate1 && validate2 && validate3 && validate4) {
                  Navigator.of(context).pop({'crp': crp,'cpf': cpf, 'primeiroNome': primeiroNome, 'segundoNome': segundoNome});
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
