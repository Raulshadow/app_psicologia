

import 'package:flutter/material.dart';

var descricao_filme = "A história acompanha Sonic, Tails, Knuckles, Amy Rose e os novatos Big the Cat e E-102 Gamma em suas aventuras para coletarem as sete Esmeraldas do Caos, além de impedirem o Doutor Robotnik de liberar um mau antigo conhecido como Caos.";

class Filmes extends StatelessWidget {
      @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Comprar Ingresso"),centerTitle: true,backgroundColor: Colors.purple[500],
          automaticallyImplyLeading: true,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () { Navigator.pop(context); },)
        ),
        body: Container(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  child: Image(image: AssetImage("images/placeholder.png"),),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5)
                    ),
                    border: Border.all(color: Colors.blueAccent)
                ),
                child: Text(descricao_filme),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {  },
          backgroundColor: Colors.purple[500],
          child: const Icon(Icons.shopping_cart)
        ),
      )
    );
  }
}
