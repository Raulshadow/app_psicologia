import 'package:app_ingresso/Filmes.dart';
import 'package:flutter/material.dart';

import 'Categorias.dart';
import 'Novo.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

const filmes = [
  {
    'image':
        'https://i.pinimg.com/originals/0d/0d/0d/0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d.jpg',
    'title': 'O Poderoso Chefão',
    'category': 'Drama',
  },
  {
    'image':
        'https://i.pinimg.com/originals/0d/0d/0d/0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d.jpg',
    'title': 'O Poderoso Chefão',
    'category': 'Ação',
  },
  {
    'image':
        'https://i.pinimg.com/originals/0d/0d/0d/0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d.jpg',
    'title': 'O Poderoso Chefão',
    'category': 'Drama',
  }
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Object? categoriaSelecionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            _awaitReturnValueFromCategoriasScreen(context);
          },
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: const Text('App Ingresso'),
        centerTitle: true,
        backgroundColor: Colors.purple[500],
      ),
      body: categoriaSelecionada == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: (filmes.map((filme) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          border: Border.all(
                            color: Colors.deepPurpleAccent,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Filmes()));
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue[50]),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin:
                                const EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.deepPurpleAccent,
                                        width: 1.5,
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blue,
                                          blurRadius: 2,
                                        )
                                      ]),
                                  child: const Image(
                                    image: NetworkImage(
                                        'https://cdn-icons-png.flaticon.com/512/4406/4406665.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 20, right: 20, top: 10),
                                  child: Text(filme['title']!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList()))
          : 
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: (filmes.map((filme) {
                if (filme['category'] == categoriaSelecionada) {

                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          border: Border.all(
                            color: Colors.deepPurpleAccent,
                            width: 2,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Filmes()));
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue[50]),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            margin:
                                const EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.deepPurpleAccent,
                                        width: 1.5,
                                        style: BorderStyle.solid,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.blue,
                                          blurRadius: 2,
                                        )
                                      ]),
                                  child: const Image(
                                    image: NetworkImage(
                                        'https://cdn-icons-png.flaticon.com/512/4406/4406665.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 20, right: 20, top: 10),
                                  child: Text(filme['title']!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
                } else {
                  return Container();
                }
              }).toList())),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Novo()));
        },
        label: const Text('Novo'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }

  void _awaitReturnValueFromCategoriasScreen(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => Categorias()));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      categoriaSelecionada = result['title'];
    });
  }
}
