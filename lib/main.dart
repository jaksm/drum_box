import 'package:flutter/material.dart';

void main() {
  runApp(DrumApp());
}

class DrumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drum Box',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black87,
          elevation: 0.0,
        ),
        scaffoldBackgroundColor: Colors.black87,
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
        ),
      ),
      home: PadsScreen(),
    );
  }
}

class PadsScreen extends StatefulWidget {
  PadsScreen({Key? key}) : super(key: key);

  @override
  _PadsScreenState createState() => _PadsScreenState();
}

class _PadsScreenState extends State<PadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drum Box'),
      ),
      body: Container(),
    );
  }
}
