import 'package:flutter/material.dart';

var descricao_filme =
    "A história acompanha Sonic, Tails, Knuckles, Amy Rose e os novatos Big the Cat e E-102 Gamma em suas aventuras para coletarem as sete Esmeraldas do Caos, além de impedirem o Doutor Robotnik de liberar um mau antigo conhecido como Caos.";

class Paciente extends StatelessWidget {
  final String name;

  const Paciente({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: const Text("Comprar Ingresso"),
          centerTitle: true,
          backgroundColor: Colors.purple[500],
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              child: const Image(
                image: AssetImage("images/placeholder.png"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.blueAccent)),
            child: Column(
              children: [
                Text('Nome:$name'),
                Text('Nome:$name'),
                Text('Nome:$name'),
                Text('Nome:$name'),

              ],
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showRemoveDialog(context);
          },
          backgroundColor: Colors.red[500],
          mini: true,
          child: const Icon(Icons.close)),
    ));
  }
}

// ----------------REMOVER Paciente ------------------

_showRemoveDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Cancelar"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Remover"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Remover Paciente"),
    content: const Text("Deseja remover o Paciente?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
