import 'package:app_ingresso/logic/mysql.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'logic/BO/BO.dart';
import 'logic/DAO/DAO.dart';

class NovaConsulta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Consulta"),
      ),
      body: const NovaConsultaForm(),
    );
  }
}

class NovaConsultaForm extends StatefulWidget {
  const NovaConsultaForm({super.key});

  @override
  _NovaConsultaFormState createState() => _NovaConsultaFormState();
}

class _NovaConsultaFormState extends State<NovaConsultaForm> {
  final _formKey = GlobalKey<FormState>();
  var db = new Mysql();
  var dao = new DAO();

  final _crpInputController = TextEditingController();
  final _cpfInputController = TextEditingController();

  bool validate1 = true;
  bool validate2 = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _crpInputController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'CRP do médico'),
          ),
          TextFormField(
            controller: _cpfInputController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'CPF do Paciente'),
          ),
          //botão submit
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                String cpf = _cpfInputController.text;
                String crp = _crpInputController.text;

                setState(() {
                  isNullOrEmpty(cpf) ? validate1 = false : validate1 = true;
                  isNullOrEmpty(crp) ? validate2 = false : validate2 = true;
                });
                if(validate1 && validate2) {
                  Navigator.of(context).pop({'cpf': cpf, 'crp':crp});
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
