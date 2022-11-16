import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Nome do Filme'),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Categoria'),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(labelText: 'Descrição'),
          ),
          const Text('Foto', style: TextStyle(color: Colors.grey, fontSize: 16)),
          ElevatedButton(onPressed: () {
            
          }, child: const Text('Adicionar')),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
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
