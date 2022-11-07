import 'package:app_ingresso/Filmes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Ingresso'),
        centerTitle: true,
        backgroundColor: Colors.purple[500],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // linha 1
          Row(
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Filmes()));
                    },
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.blue[50]),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
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
                          const Text(
                            '   Ingresso 1',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // linha 2
          Row(
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Filmes()));
                    },
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.blue[50]),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
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
                          const Text(
                            '   Ingresso 2',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // linha 3
          Row(
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Filmes()));
                    },
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.blue[50]),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
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
                          const Text(
                            '   Ingresso 3',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      
    );
  }
}
