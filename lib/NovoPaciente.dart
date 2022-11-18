import 'package:app_ingresso/logic/BO/BO.dart';
import 'package:app_ingresso/logic/mysql.dart';
import 'package:flutter/material.dart';
import 'package:app_ingresso/logic/models/paciente.dart';
import 'package:image_picker/image_picker.dart';

class NovoPaciente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Paciente"),
      ),
      body: const NovoPacienteForm(),
    );
  }
}

class NovoPacienteForm extends StatefulWidget {
  const NovoPacienteForm({super.key});

  @override
  _NovoPacienteFormState createState() => _NovoPacienteFormState();
}

class _NovoPacienteFormState extends State<NovoPacienteForm> {
  final _formKey = GlobalKey<FormState>();
  var db = new Mysql();

  final _primeiroNomeInputController = TextEditingController();
  final _segundoNomeInputController = TextEditingController();
  final _cpfInputController = TextEditingController();

  bool validate1 = true;
  bool validate2 = true;
  bool validate3 = true;

  isDefault(Paciente paciente) {
    if(paciente.id == -1 && paciente.cpf == '') {
      return true;
    } return false;
  }

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
          //botão submit
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                String cpf = _cpfInputController.text;
                String primeiroNome = _primeiroNomeInputController.text;
                String segundoNome = _segundoNomeInputController.text;

                setState(() {
                  isNullOrEmpty(cpf) ? validate1 = false : validate1 = true;
                  isNullOrEmpty(primeiroNome) ? validate2 = false : validate2 = true;
                  isNullOrEmpty(segundoNome) ? validate3 = false : validate3 = true;
                });
                if(validate1 && validate2 && validate3) {
                  widget.paciente = new Paciente(cpf, widget.paciente.id, primeiroNome, segundoNome);
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
