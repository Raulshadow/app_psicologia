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
            Row(
              // linha 1
              children: [
                Expanded(
                  child: Container(
                    height: 75,
                    child: FlatButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Text ("Ingresso 1"),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              // linha 1
              children: [
                Expanded(
                  child: Container(
                    height: 75,
                    child: FlatButton(
                      color: Colors.green,
                      onPressed: () {},
                      child: Text ("Ingresso 2"),
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
