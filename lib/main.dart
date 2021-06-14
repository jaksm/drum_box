import 'package:audioplayers/audioplayers.dart';
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

class Pad extends StatefulWidget {
  final String sound;
  final MaterialColor color;

  const Pad({Key? key, required this.sound, required this.color})
      : super(key: key);

  @override
  _PadState createState() => _PadState();
}

class _PadState extends State<Pad> {
  bool isPlaying = false;
  final player = AudioPlayer();

  // Start or stop audio reproduction based on isPlaying
  void togglePlaying() {
    if (isPlaying) {
      player.stop();
    } else {
      player.play(widget.sound);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            isPlaying = true;
            togglePlaying();
          });
        },
        onTapUp: (details) {
          setState(() {
            isPlaying = false;
            togglePlaying();
          });
        },
        child: Container(
          color: this.isPlaying ? Colors.white : widget.color,
        ),
      ),
    );
  }
}
