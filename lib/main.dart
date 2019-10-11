import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final audioPlayer = AudioCache();

  playLocal() {
    audioPlayer.play('note1.wav');
  }

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    final colors = <Color>[
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.orange,
      Colors.teal,
      Colors.blue,
      Colors.purple,
    ];

    for(int i = 1; i < 8; i++) {
      widgets.add(new SoundButton(
        note: i,
        audioPlayer: audioPlayer,
        color: colors[i],
      ));
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: widgets,
          ),
        ),
      ),
    );
  }
}

class SoundButton extends StatelessWidget {
  SoundButton({
    this.note,
    this.audioPlayer,
    this.color,
  });

  final int note;
  final audioPlayer;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          final number = this.note;
          audioPlayer.play('note$number.wav');
        },

      ),
    );
  }
}
