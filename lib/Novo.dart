import 'package:app_ingresso/logic/mysql.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Novo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Filme"),
      ),
      body: const NewMovieForm(),
    );
  }
}

class NewMovieForm extends StatefulWidget {
  const NewMovieForm({super.key});

  @override
  _NewMovieFormState createState() => _NewMovieFormState();
}

class _NewMovieFormState extends State<NewMovieForm> {
  final _formKey = GlobalKey<FormState>();
  var db = new MySql();

  final _primeiroNomeInputController = TextEditingController();
  String _primeiroNome = "";
  final _segundoNomeInputController = TextEditingController();
  String _segundoNome = "";
  final _cpfInputController = TextEditingController();
  String _cpf = "";


  void insert(String values, String table) {
      db.getConnection().then((conn) {
        String sql = "INSERT INTO" + table + "(" + values + ");";
      });
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
            decoration: const InputDecoration(labelText: 'Nome do Filme'),
          ),
          TextFormField(
            controller: _segundoNomeInputController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Categoria'),
          ),
          TextFormField(
            controller: _cpfInputController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Descrição'),
          ),
          //botão submit
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _cpf = _cpfInputController.text;
                  _primeiroNome = _primeiroNomeInputController.text;
                  _segundoNome = _segundoNomeInputController.text;

                  insert("'"+ _cpf +"',DEFAULT,'"+ _primeiroNome +"','"
                         + _segundoNome+"'","paciente");

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')));
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
