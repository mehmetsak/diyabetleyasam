import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



class bildirim extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: deneme(),
    );
  }
}

class deneme extends StatefulWidget {
  @override
  _denemeState createState() => _denemeState();
}

class _denemeState extends State<deneme> {
  final  TimeOfDay suankisaat=TimeOfDay.now();
  FlutterLocalNotificationsPlugin localNotification;
  @override
  void initState() {


    super.initState();

    var androidInitialize= new AndroidInitializationSettings('ic_launcher');
    var ioSIntialize = new IOSInitializationSettings();
    var initializationSettings= new InitializationSettings(android:androidInitialize,iOS:ioSIntialize  );
    localNotification =FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
  }
  Future _show() async{
    var androidDetails= new AndroidNotificationDetails("channelId","channelName" ,
        "Bildirim açıklaması, istenilen mesaj yazma kısmı",importance: Importance.high);
    var iosDetails= new IOSNotificationDetails();
    var generalNotificationDetails= new NotificationDetails(android:androidDetails,iOS:iosDetails  );
    await localNotification.show(0, "Alarm", "İlaç saatiniz :)", generalNotificationDetails);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(""),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _show,
        child: Icon(Icons.notifications),

      ),

    );
  }
}
