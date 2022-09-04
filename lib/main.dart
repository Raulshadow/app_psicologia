import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Ingresso'),
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
                    margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
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
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue[50]),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.deepPurpleAccent,
                                    width: 1.5,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue,
                                      blurRadius: 2,
                                    )
                                  ]),
                              child: Image(
                                image: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/4406/4406665.png'),
                              ),
                            ),
                            Text(
                              '   Ingresso 1',
                              style: const TextStyle(color: Colors.black),
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
                    margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
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
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue[50]),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.deepPurpleAccent,
                                    width: 1.5,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue,
                                      blurRadius: 2,
                                    )
                                  ]),
                              child: Image(
                                image: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/4406/4406665.png'),
                              ),
                            ),
                            Text(
                              '   Ingresso 2',
                              style: const TextStyle(color: Colors.black),
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
                    margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
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
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.blue[50]),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 5.0),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.deepPurpleAccent,
                                    width: 1.5,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue,
                                      blurRadius: 2,
                                    )
                                  ]),
                              child: Image(
                                image: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/4406/4406665.png'),
                              ),
                            ),
                            Text(
                              '   Ingresso 3',
                              style: const TextStyle(color: Colors.black),
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
      ),
    );
  }
}
