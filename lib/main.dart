import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body:Column(
          children: [
            Row(// linha 1
              children: [
                Text('Linha 1')
              ],
            ),
            Row( // linha 2
              children: [
                Text('Linha 2')
              ],
            ),
          ],
        ) ,
        appBar: AppBar(
          title: Text('App Ingresso'),
          centerTitle: true,
          backgroundColor: Colors.purple[500],
        ),
      ),
    ),
  );
}
