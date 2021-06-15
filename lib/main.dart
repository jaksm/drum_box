import 'package:assets_audio_player/assets_audio_player.dart';
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
      home: PadsGrid(),
    );
  }
}

class PadsGrid extends StatelessWidget {
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
              sound: 'kicks1.wav',
            ),
            Pad(
              color: Colors.orange,
              sound: 'kicks2.wav',
            ),
            Pad(
              color: Colors.orange,
              sound: 'kicks3.wav',
            ),
            Pad(
              color: Colors.green,
              sound: 'drums1.wav',
            ),
            Pad(
              color: Colors.green,
              sound: 'drums2.wav',
            ),
            Pad(
              color: Colors.green,
              sound: 'drums2.wav',
            ),
            Pad(
              color: Colors.deepPurple,
              sound: 'melody1.wav',
            ),
            Pad(
              color: Colors.deepPurple,
              sound: 'melody2.wav',
            ),
            Pad(
              color: Colors.deepPurple,
              sound: 'melody3.wav',
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
  final player = AssetsAudioPlayer();

  void togglePlaying() async {
    if (isPlaying) {
      await player.open(
        Audio('assets/${widget.sound}'),
      );
    } else {
      await player.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (details) {
          setState(() {
            isPlaying = true;
          });
          togglePlaying();
        },
        onTapUp: (details) {
          setState(() {
            isPlaying = false;
          });
          togglePlaying();
        },
        child: Container(
          color: this.isPlaying ? Colors.white : widget.color,
        ),
      ),
    );
  }
}
