import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';



class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Oynatıcı'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: const Text('Kurulan alarm başlat'),
                  onPressed: () {
                    FlutterRingtonePlayer.playAlarm();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: const Text('Kurulan alarm kapat'),
                  onPressed: () {
                    FlutterRingtonePlayer.playAlarm(asAlarm: false);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: const Text('Telefon mesaj sesi'),
                  onPressed: () {
                    FlutterRingtonePlayer.playNotification();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: const Text('Telefon zil sesi'),
                  onPressed: () {
                    FlutterRingtonePlayer.playRingtone();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: const Text('Aralıksız ses modu'),
                  onPressed: () {
                    FlutterRingtonePlayer.play(
                      android: AndroidSounds.notification,
                      ios: IosSounds.glass,
                      looping: true,
                      volume: 1.0,
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: RaisedButton(
                  child: const Text('kapat'),
                  onPressed: () {
                    FlutterRingtonePlayer.stop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}