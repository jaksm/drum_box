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
      body: Center(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          children: [
            Pad(
              color: Colors.orange,
              sound: 'assets/',
            ),
            Pad(
              color: Colors.blue,
              sound: 'assets/',
            ),
            Pad(
              color: Colors.red,
              sound: 'assets/',
            ),
            Pad(
              color: Colors.green,
              sound: 'assets/',
            ),
            Pad(
              color: Colors.yellow,
              sound: 'assets/',
            ),
            Pad(
              color: Colors.teal,
              sound: 'assets/',
            ),
            Pad(
              color: Colors.deepPurple,
              sound: 'assets/',
            ),
            Pad(
              color: Colors.amber,
              sound: 'assets/',
            ),
            Pad(
              color: Colors.indigo,
              sound: 'assets/',
            ),
          ],
        ),
      ),
    );
  }
}

class Pad extends StatelessWidget {
  final String sound;
  final MaterialColor color;

  Pad({required this.sound, required this.color});

  void playSound() {
    print('Playing sound ${this.sound}');
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.playSound,
      child: Container(
        color: this.color,
      ),
    );
  }
}
