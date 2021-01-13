import 'package:diyabetle_yasam/diyabaet_besin_takvimi.dart';
import 'package:diyabetle_yasam/diyabet_deger_hesaplama.dart';
import 'package:diyabetle_yasam/diyabet_ilac_alarmlari.dart';
import 'package:diyabetle_yasam/diyabet_kontroller.dart';
import 'package:diyabetle_yasam/diyabet_login.dart';
import 'package:diyabetle_yasam/diyabet_oneriler.dart';
import 'package:diyabetle_yasam/diyabet_suphe_testi.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';
FirebaseAuth _auth = FirebaseAuth.instance;
class DiyabetAnaMenu extends StatefulWidget {



  @override

  _DiyabetAnaMenuState createState() => _DiyabetAnaMenuState();
}

class _DiyabetAnaMenuState extends State<DiyabetAnaMenu> {
 // final String mail;
  //final String password;
  //DiyabetAnaMenu(this.mail, this.password);
  SharedPreferences logindata;
  String username;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username');
    });
  }


  @override
  Widget build(BuildContext context) {
    /*
    void _cikis() async {
      if(_auth.currentUser != null){
        SharedPrefs.sharedClear();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DiyabetLogin()),
                (_) => false);
        await _auth.signOut();

      }else{ debugPrint("Zaten kapalı");}
    }
     */

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Diyabetle Yaşam",
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[


                Container(
                  //constraints: BoxConstraints.expand(
                  // height: Theme.of(context).textTheme.headline4.fontSize * 1.1 + 100.0,
                  // ),

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
                        "İlaç Alarmlarım",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        "İlaçlarınızı saatinizde almanız için alarmlar kurma işlemleri içindir. \n",
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/ilacalarm');
                      },
                    ),
                  ),
                ),
                Divider(color: Colors.blueGrey, indent: 2, height: 12),
                Container(
                  child: Card(
                    color: Colors.lightBlue.shade100,
                    margin: EdgeInsets.all(10),
                    elevation: 7,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.lightbulb_outline,
                          )),
                      title: Text(
                        "Düzenli Muayene Kontrolüm",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        "Muayenelerinizi doğru zamanda olmak için sizi uyaran istediğiniz tarihte hatırlatma ekleyebilirsiniz. \n",
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/kontroller');
                      },
                    ),
                  ),
                ),
                Divider(color: Colors.blueGrey, indent: 2, height: 12),
                Container(
                  child: Card(
                    color: Colors.lightBlue.shade100,
                    margin: EdgeInsets.all(10),
                    elevation: 7,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.event,
                          )),
                      title: Text(
                        "Besin Takvimim",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        "Günlük besin değerlerinizi buraya girdiğiniz takdirde günlük, haftalık, aylık veya yıl boyu ne kadar iyi beslendiğinizi görebileceksiniz.  ",
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/customhotizol');
                      },
                    ),
                  ),
                ),
                Divider(color: Colors.blueGrey, indent: 2, height: 12),
                Container(
                  child: Card(
                    color: Colors.lightBlue.shade100,
                    margin: EdgeInsets.all(10),
                    elevation: 7,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.check_circle_outline,
                          )),
                      title: Text(
                        "Şüphe Testi",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        "Etrafınızda diyabet hastası olduğundan şüphelenen bireylere mutlaka doktora gitmeden önce bu testi önerin."
                        "Testin sonucuna göre uyarılar yapılmaktadır.",
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/suphetesti');
                      },
                    ),
                  ),
                ),
                /*
                Divider(color: Colors.blueGrey, indent: 2, height: 12),
                Container(
                  child: Card(
                    color: Colors.lightBlue.shade100,
                    margin: EdgeInsets.all(10),
                    elevation: 7,
                    child: ListTile(
                      leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.border_color,
                          )),
                      title: Text(
                        "Değerlerinizi Hesaplayın",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        "",
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/degerhesap');
                      },
                    ),
                  ),
                ),
                 */

                Divider(color: Colors.blueGrey, indent: 2, height: 12),
              ],
            ),
            Container(
              //constraints: BoxConstraints.expand(
              // height: Theme.of(context).textTheme.headline4.fontSize * 1.1 + 100.0,
              // ),

              child: Card(
                color: Colors.lightBlue.shade100,
                margin: EdgeInsets.all(10),
                elevation: 7,
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.accessibility_new,
                      )),
                  title: Text(
                    "Öneriler",
                    style: TextStyle(fontSize: 22),
                  ),
                  subtitle: Text(
                    "Sağlınıza faydalı olacağını düşündüğümüz beslenme ve egzersizler",
                    style: TextStyle(fontSize: 15),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/oneriler');
                  },
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
                color: Colors.blueGrey,
                child:Text("Çıkış",style: TextStyle(color: Colors.white),)

            ),
            RaisedButton(

                color: Colors.blueGrey,
                child: Icon(
                  Icons.vpn_key,
                  color: Colors.white,
                  size: 25.0,
                  semanticLabel: '',
                ),

                onPressed:(){setState(() {
                 // TestSonucAlerthata();
                  _cikis();
                });} ),
          ],
        ));


  }
  void TestSonucAlerthata(

      ) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          "Emin Misiniz?",
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

                Navigator.pop(context);
               // Navigator.pushReplacementNamed(context, '/Login');
                // Navigator.push(
                //   context,
                // MaterialPageRoute(
                //   builder: (context) => DiyabetSupheTesti()));
              }),
          new RaisedButton(
              child: Icon(
                Icons.done,
              ),
              onPressed: () {

                _cikis();


                // Navigator.push(
                //   context,
                // MaterialPageRoute(
                //   builder: (context) => DiyabetSupheTesti()));
              }),
        ],
      ),
    );
  }
  void _cikis() async {
    if(_auth.currentUser != null){

      await _auth.signOut();
      Navigator.pop(context);
      logindata.setBool('login', true);
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => DiyabetLogin()));
    }else{ debugPrint("Zaten kapalı");
    await _auth.signOut();
    Navigator.pop(context);
    logindata.setBool('login', true);
    Navigator.pushReplacement(context,
        new MaterialPageRoute(builder: (context) => DiyabetLogin()));}
    }

}
/*
  ,
 */
