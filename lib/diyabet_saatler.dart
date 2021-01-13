import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Saatler extends StatefulWidget {

  @override

  SaatlerState createState() => new SaatlerState();
}

class SaatlerState extends State< Saatler> {
  FlutterLocalNotificationsPlugin localNotification;
  var ilkalarm;
  var ikialarm;
  var ucalarm;
var ilksaat;
var ilkdakika;
var ikisaat;
var ikidakika;
var ucsaat;
var ucdakika;
var alarmsayisi;
  bool visibility1 =true;
  bool visibility2=false;
  bool visibility3=false ;
  bool visibility4=true ;
  bool visibility5=false ;
  bool visibility6=false ;
  TimeOfDay suankisaat=TimeOfDay.now();
  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "bir"){
        visibility1 = visibility;
      }
      if (field == "iki"){
        visibility2 = visibility;
      }
      if (field == "uc"){
        visibility3 = visibility;
      }
      if (field == "dort"){
        visibility4 = visibility;
      }
      if (field == "bes"){
        visibility5 = visibility;
      }
      if (field == "altı"){
        visibility6 = visibility;
      }

    });
  }
@override
Future _adetvericekme() async {
  //tek bir dökümanın okunması
  DocumentSnapshot documentSnapshot =
  await _firestore.doc("users/mehmet_sakir").get();

  documentSnapshot.data().forEach((key, deger) {
    debugPrint("key : $key deger :deger");
    alarmsayisi= documentSnapshot.data()['adet'].toString();
    ilksaat= documentSnapshot.data()['ilksaat'].toString();
    ilkdakika= documentSnapshot.data()['ilkdakika'].toString();
    ikisaat= documentSnapshot.data()['ikisaat'].toString();
    ikidakika= documentSnapshot.data()['ikidakika'].toString();
    ucsaat= documentSnapshot.data()['ucsaat'].toString();
    ucdakika= documentSnapshot.data()['ucdakika'].toString();
    ilkalarm= documentSnapshot.data()['ilkalarm'].toString();
    ikialarm= documentSnapshot.data()['ikialarm'].toString();
    ucalarm= documentSnapshot.data()['ucalarm'].toString();


    debugPrint("aynen aynen $alarmsayisi");
    if(alarmsayisi=="1"){
      visibility1 = true;
       visibility2= false;
       visibility3 = false;
       visibility4 = true;
       visibility5 = false;
       visibility6 = false;
    }
    else if(alarmsayisi=="2"){
      visibility1 = true;
      visibility2= true;
      visibility3 = false;
      visibility4 = true;
      visibility5 = true;
      visibility6 = false;
    }
   else if(alarmsayisi=="3"){
      visibility1 = true;
      visibility2= true;
      visibility3 = true;
      visibility4 = true;
      visibility5 = true;
      visibility6 = true;
    }
  });
}

  @override
  void  initState() {
    // TODO: implement initState
    super.initState();
    var androidInitialize= new AndroidInitializationSettings('ic_launcher');
    var ioSIntialize = new IOSInitializationSettings();
    var initializationSettings= new InitializationSettings(android:androidInitialize,iOS:ioSIntialize  );
    localNotification =FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);

    super.initState();

    _adetvericekme();
    if(suankisaat=="$ilkalarm"/* || suankisaat==ikialarm || suankisaat ==ucalarm*/ )
{
  debugPrint("girdi");
  FlutterRingtonePlayer.playAlarm();
  _show();
  TestSonucAlerthata();
}
    else{

    }
  }

  Future _show() async{
    var androidDetails= new AndroidNotificationDetails("channelId","channelName" ,
        "Bildirim mesaj kısmı istenilen mesaj",importance: Importance.high);
    var iosDetails= new IOSNotificationDetails();
    var generalNotificationDetails= new NotificationDetails(android:androidDetails,iOS:iosDetails  );
    await localNotification.show(0, "Alarm", "saatiniz :)", generalNotificationDetails);
  }

  @override

  Widget build(BuildContext context) {

    void cekmeyeri(int cekmis) {


    }
    alarmislem() {
      setState(() {
        showTimePicker(context: context, initialTime: suankisaat);
      });
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "İlaç Alarmları",
          ),
        ),

        body: ListView(

          children: <Widget>[
            Column(

              children: <Widget>[
                visibility1 ?  Container(


                  child: Card(
                    color: Colors.lightBlue.shade100,
                    margin: EdgeInsets.all(10),
                    elevation: 7,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.access_time,
                          )),
                      title: Text(
                        "İlk Alarm",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        "$ilksaat:$ilkdakika",
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                ) : new Container(),

                visibility4 ?  RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed:(){
                      setState(() {
                        showTimePicker(context: context, initialTime: suankisaat).then((secilenalarm1){

                          debugPrint(secilenalarm1.format(context));
                          ilkalarm=secilenalarm1;

                          ilksaat=secilenalarm1.hour;
                          ilkdakika=secilenalarm1.minute;

                        });
                      });
                    }): new Container(),
                /*
                 RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed: () {

                      // Navigator.pop(context);
                      _changed(false, "bir");
                      // Navigator.push(
                      //   context,
                      // MaterialPageRoute(
                      //   builder: (context) => DiyabetSupheTesti()));
                    }),
                RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed: () {

                      // Navigator.pop(context);
                      visibility1 ? null : _changed(true, "bir");
                      // Navigator.push(
                      //   context,
                      // MaterialPageRoute(
                      //   builder: (context) => DiyabetSupheTesti()));
                    }),
                 */

                visibility2 ?  Container(


                  child: Card(
                    color: Colors.lightBlue.shade100,
                    margin: EdgeInsets.all(10),
                    elevation: 7,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.access_time,
                          )),
                      title: Text(
                        "İkinci Alarm",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        "$ikisaat:$ikidakika",
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                ) : new Container(),
                visibility5 ? RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed: (){
                      setState(() {
                        showTimePicker(context: context, initialTime: suankisaat).then((secilenalarm2){

                          debugPrint(secilenalarm2.format(context));
                          ikisaat=secilenalarm2.hour;
                          ikidakika=secilenalarm2.minute;
                          ikialarm=secilenalarm2;

                        });
                      });

                    }) : new Container(),
                /*
                 RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed: () {

                      // Navigator.pop(context);
                      _changed(false, "iki");
                      // Navigator.push(
                      //   context,
                      // MaterialPageRoute(
                      //   builder: (context) => DiyabetSupheTesti()));
                    }),
                RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed: () {

                      // Navigator.pop(context);
                      visibility2 ? null : _changed(true, "iki");
                      // Navigator.push(
                      //   context,
                      // MaterialPageRoute(
                      //   builder: (context) => DiyabetSupheTesti()));
                    }),
                 */

                visibility3 ?  Container(


                  child: Card(
                    color: Colors.lightBlue.shade100,
                    margin: EdgeInsets.all(10),
                    elevation: 7,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.access_time,
                          )),
                      title: Text(
                        "Üçüncü Alarm",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        "$ucsaat:$ucdakika",
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                ) : new Container(),
                visibility6 ? RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed: (){
                      setState(() {
                        showTimePicker(context: context, initialTime: suankisaat).then((secilenalarm3){

                          debugPrint(secilenalarm3.format(context));
                          ucsaat=secilenalarm3.hour;
                          ucdakika=secilenalarm3.minute;
                          ucalarm=secilenalarm3;

                        });
                      });
                    }): new Container(),
                /*
                 RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed: () {

                      // Navigator.pop(context);
                      _changed(false, "uc");
                      // Navigator.push(
                      //   context,
                      // MaterialPageRoute(
                      //   builder: (context) => DiyabetSupheTesti()));
                    }),
                RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed: () {

                      // Navigator.pop(context);
                      visibility3 ? null : _changed(true, "uc");
                      // Navigator.push(
                      //   context,
                      // MaterialPageRoute(
                      //   builder: (context) => DiyabetSupheTesti()));
                    }),
                 */
                RaisedButton(


                    child: Text("Onay",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    color: Colors.green.shade600,
                    onPressed:(){
                      _alarmekle1();
                      _alarmEkle2();
                      _alarmEkle3();

                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/ilacalarm');
                    },


                    // Navigator.pushReplacementNamed(context, '/anamenu');
                  ),
                /*
                 RaisedButton(


                  child: Text("Oku",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  color: Colors.green.shade600,
                  onPressed:(){

                    _alarmoku1();
                    _alarmoku2();
                    _alarmoku3();

                  },


                  // Navigator.pushReplacementNamed(context, '/anamenu');
                ),
                 */


              ],
            ),



          ],
        )

    );
  }


Future _alarmoku1() async {
  //tek bir dökümanın okunması
  DocumentSnapshot documentSnapshot =
  await _firestore.doc("users/mehmet_sakir").get();
  debugPrint("Döküman id:" + documentSnapshot.id);
  debugPrint("Döküman var mı:" + documentSnapshot.exists.toString());

  debugPrint("cacheden mi geldi:" + documentSnapshot.data()['ayakgirilenilk']);
  debugPrint(
      "cacheden mi geldi:" + documentSnapshot.data()['ayaksontarih'].toString());
  documentSnapshot.data().forEach((key, deger) {
    debugPrint("key : $key deger :deger");
    ilksaat= documentSnapshot.data()['ilksaat'].toString();
    ilkdakika= documentSnapshot.data()[' ilkdakika'].toString();
  });
}

void _alarmekle1() {
  debugPrint("ayak fonksiyona girildi");
  Map<String, dynamic> sakirEkle = Map();

  sakirEkle['ilksaat'] = "$ilksaat";
  sakirEkle['ilkdakika'] = "$ilkdakika";
  sakirEkle['ilkalarm'] = "$ilkalarm";


  _firestore
      .collection("users")
      .doc("mehmet_sakir")
      .set(sakirEkle, SetOptions(merge: true))
      .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
}
Future _alarmoku2() async {
  //tek bir dökümanın okunması
  DocumentSnapshot documentSnapshot =
  await _firestore.doc("users/mehmet_sakir").get();
  debugPrint("Döküman id:" + documentSnapshot.id);
  debugPrint("Döküman var mı:" + documentSnapshot.exists.toString());

  debugPrint("cacheden mi geldi:" + documentSnapshot.data()['ayakgirilenilk']);
  debugPrint(
      "cacheden mi geldi:" + documentSnapshot.data()['ayaksontarih'].toString());
  documentSnapshot.data().forEach((key, deger) {
    debugPrint("key : $key deger :deger");
    ikisaat= documentSnapshot.data()['ikisaat'].toString();
    ikidakika= documentSnapshot.data()[' ikidakika'].toString();
  });
}

void _alarmEkle2() {
  debugPrint("ayak fonksiyona girildi");
  Map<String, dynamic> sakirEkle = Map();

  sakirEkle['ikisaat'] = "$ikisaat";
  sakirEkle['ikidakika'] ="$ikidakika" ;
  sakirEkle['ikialarm'] ="$ikialarm" ;


  _firestore
      .collection("users")
      .doc("mehmet_sakir")
      .set(sakirEkle, SetOptions(merge: true))
      .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
}
Future _alarmoku3() async {
  //tek bir dökümanın okunması
  DocumentSnapshot documentSnapshot =
  await _firestore.doc("users/mehmet_sakir").get();
  debugPrint("Döküman id:" + documentSnapshot.id);
  debugPrint("Döküman var mı:" + documentSnapshot.exists.toString());

  debugPrint("cacheden mi geldi:" + documentSnapshot.data()['ayakgirilenilk']);
  debugPrint(
      "cacheden mi geldi:" + documentSnapshot.data()['ayaksontarih'].toString());
  documentSnapshot.data().forEach((key, deger) {
    debugPrint("key : $key deger :deger");
    ucsaat= documentSnapshot.data()['ucsaat'].toString();
    ucdakika= documentSnapshot.data()[' ucdakika'].toString();
  });
}

void _alarmEkle3() {
  debugPrint("ayak fonksiyona girildi");
  Map<String, dynamic> sakirEkle = Map();
  sakirEkle['ucsaat'] ="$ucsaat";
  sakirEkle['ucdakika'] ="$ucdakika";
  sakirEkle['ucalarm'] ="$ucalarm";


  _firestore
      .collection("users")
      .doc("mehmet_sakir")
      .set(sakirEkle, SetOptions(merge: true))
      .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
}
  void TestSonucAlerthata(

      ) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          "İlac Saati",
          style: TextStyle(color: Colors.blueGrey, fontSize: 20),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                margin: EdgeInsets.all(7),

              ),

              Divider(color: Colors.blueGrey, indent: 2, height: 12),
            ],
          ),
        ),
        actions: <Widget>[
          new RaisedButton(
              child: Icon(
                Icons.close,
              ),
              onPressed: () {
                FlutterRingtonePlayer.playAlarm(asAlarm: false);
                Navigator.pop(context);

                // Navigator.push(
                //   context,
                // MaterialPageRoute(
                //   builder: (context) => DiyabetSupheTesti()));
              }),
        ],
      ),
    );
  }

}
