import 'package:diyabetle_yasam/diyabaet_besin_takvimi.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyabetle_yasam/diyabet_ana_menu.dart';
import 'package:diyabetle_yasam/diyabet_deger_hesaplama.dart';
import 'package:diyabetle_yasam/diyabet_ilac_alarmlari.dart';
import 'package:diyabetle_yasam/diyabet_kontroller.dart';
import 'package:diyabetle_yasam/diyabet_oneriler.dart';
import 'package:diyabetle_yasam/diyabet_saatler.dart';
import 'package:diyabetle_yasam/diyabet_suphe_testi.dart';
import 'package:diyabetle_yasam/ilac_alarm_ekle.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'alarmmanagerdeneme.dart';
import '../../diyabetleyasam/.idea/bildirim.dart';
import 'bombosfire.dart';
import 'bos1.dart';
import 'custom_hortizal.dart';
import 'deneme_alarm.dart';
import 'diyabet_kayit_ol.dart';
import 'diyabet_kayitislemleri.dart';
import 'diyabet_login.dart';
import 'diyabet_loginicin_suphe_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'diyabet_ana_menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


import 'diyabet_sifre_unuttum.dart';
import 'diyabet_suphe_testi.dart';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =FlutterLocalNotificationsPlugin();
FirebaseAuth _auth = FirebaseAuth.instance;

void main() => runApp(MyApps());

class MyApps extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Login': (context)=>giris(),
        '/Loginsuphetest': (context)=>DiyabetSupheTestilogin(),
        '/kayitLoginislemleri': (context)=>Loginislemleri(),
        '/kayitApp': (context)=>App(),
        '/diyabetlogin': (context)=>DiyabetLogin (),
        '/diyabetilacalarmekleme': (context)=>IlacAlarmi (),
        '/diyabetsaatler': (context)=>Saatler (),


        '/anamenu': (context) => DiyabetAnaMenu(),
       '/ilacalarm': (context) => DiyabetIlacAlarmi(),
        '/kontroller': (context) => DiyabetKontroller(),

        '/suphetesti': (context) => DiyabetSupheTesti(),
       // '/degerhesap': (context) => DiyabetDegerHesaplama(),
        '/oneriler': (context) => DiyabetOneriler(),
        '/sifre': (context) => Diyabetsifre(),
        '/customhotizol': (context) => MyAppsa (),
        'Login/anamenu': (context) => DiyabetAnaMenu(),
        'Login/anamenu/ilacalarm': (context) => DiyabetIlacAlarmi(),
        'Login/anamenu/kontroller': (context) => DiyabetKontroller(),

        'Login/anamenu/suphetesti': (context) => DiyabetSupheTesti(),
      //  'Login/anamenu/degerhesap': (context) => DiyabetDegerHesaplama(),
        'Login/anamenu/oneriler': (context) => DiyabetOneriler(),
        'Login/anamenu/customhotizol': (context) => MyAppsa (),

      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blueGrey,
      ),
      home:giris(),
    );
  }



}
class giris extends StatelessWidget {


  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("hata çıktı"+snapshot.error.toString()),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {

          return DiyabetLogin();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

}