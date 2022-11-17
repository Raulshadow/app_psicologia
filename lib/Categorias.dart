import 'package:app_ingresso/main.dart';
import 'package:flutter/material.dart';

const Categorias_data = [
  {
    'id': 'c1',
    'title': 'Ação',
    'color': Colors.red,
    'quantidade': 3,
  },
  {
    'id': 'c2',
    'title': 'Aventura',
    'color': Colors.blue,
    'quantidade': 3,
  },
  {
    'id': 'c3',
    'title': 'Comédia',
    'color': Colors.green,
    'quantidade': 3,
  },
  {
    'id': 'c4',
    'title': 'Drama',
    'color': Colors.purple,
    'quantidade': 3,
  },
  {
    'id': 'c5',
    'title': 'Ficção Científica',
    'color': Colors.orange,
    'quantidade': 3,
  },
  {
    'id': 'c6',
    'title': 'Romance',
    'color': Colors.pink,
    'quantidade': 3,
  },
  {
    'id': 'c7',
    'title': 'Terror',
    'color': Colors.black,
    'quantidade': 3,
  },
];

class Categorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias"),
      ),
      body: ListView(
        children: Categorias_data.map((current) {
          return Card(
            child: ListTile(
              title: Text(current['title'].toString()),
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
