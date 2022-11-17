import 'package:app_ingresso/main.dart';
import 'package:flutter/material.dart';

const Psicologos_data = [
  {
    'id': 'c1',
    'nome': 'Adams',
    'quantidade': 3,
  },
  {
    'id': 'c2',
    'nome': 'Baker',
    'quantidade': 3,
  },
  {
    'id': 'c3',
    'nome': 'Clark',
    'quantidade': 3,
  },
  {
    'id': 'c4',
    'nome': 'Davis',
    'quantidade': 3,
  },
  {
    'id': 'c5',
    'nome': 'Evans',
    'quantidade': 3,
  },
  {
    'id': 'c6',
    'nome': 'Frank',
    'quantidade': 3,
  },
  {
    'id': 'c7',
    'nome': 'Ghosh',
    'quantidade': 3,
  },
];

class Psicologos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Psicólogos"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 15, bottom: 20, right: 20, top: 15),
            child: Text('cancelar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )),
          )
        ],
      ),
      body: ListView(
        children: Psicologos_data.map((current) {
          return Card(
            child: ListTile(
              title: Text(current['nome'].toString()),
              trailing: Text(current['quantidade'].toString()),
              onTap: () {
                Navigator.pop(context, current);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
