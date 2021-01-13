import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';



class alamanager extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

showprint() {
  print('alarm done');
}

class _MyAppState extends State<alamanager> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: OutlineButton(
            child: Text('Alarm now'),
            onPressed: () {
              AndroidAlarmManager.periodic(Duration(seconds: 3), 0, showprint);
            },
          ),
        ),
      ),
    );
  }
}
