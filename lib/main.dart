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
                    margin: EdgeInsets.all(5.0),
                    height: 75,
                    child: FlatButton(
                      color: Colors.red,
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 10.0),
                        child: Row(
                          children: [
                            Image(
                              image: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/4406/4406665.png'),
                            ),
                            Text(
                              '   Ingresso 1',
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              // linha 2
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    height: 75,
                    child: FlatButton(
                      color: Colors.green,
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 10.0),
                        child: Row(
                          children: [
                            Image(
                              image: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/4406/4406665.png'),
                            ),
                            Text(
                              '   Ingresso 2',
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
