



import 'package:flutter/material.dart';

import 'ilac_alarm_ekle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final FirebaseFirestore _firestore = FirebaseFirestore.instance;


class DiyabetIlacAlarmi extends StatefulWidget {
  @override
  DiyabetIlacAlarmiState createState() => new DiyabetIlacAlarmiState();
}

class DiyabetIlacAlarmiState extends State< DiyabetIlacAlarmi> {
  bool visibility1 = false;
  bool visibility2= false;
  bool visibility3 = false;
  bool visibility4 = false;
  bool visibility5 = false;
  var eklenenalarmsayisi;
  var ilacisim;
  var ilactipi;
  var adet;
  var ilactipi2;
  var ilactipi3;
  var ilactipi4;
  var ilactipi5;

  @override
  Future _adetvericekme() async {
    //tek bir dökümanın okunması
    DocumentSnapshot documentSnapshot =
    await _firestore.doc("users/mehmet_sakir").get();

    documentSnapshot.data().forEach((key, deger) {
      debugPrint("key : $key deger :deger");
      eklenenalarmsayisi= documentSnapshot.data()['adet'].toString();
      ilactipi= documentSnapshot.data()['ilactipi'].toString();
      ilacisim= documentSnapshot.data()['ilacisim'].toString();
      adet= documentSnapshot.data()['adet'].toString();
      debugPrint("aynen aynen $eklenenalarmsayisi");
      //eklelen_alarm sayısı yapılmadı girmiyor.
      if(eklenenalarmsayisi=="2"){
        visibility1 = true;
        visibility2= true;
        visibility3 = false;
        visibility4 = false;
        visibility5 = false;

      }
      else if(eklenenalarmsayisi=="3"){
        visibility1 = true;
        visibility2= true;
        visibility3 = true;
        visibility4 = false;
        visibility5 = false;

      }
      else if(eklenenalarmsayisi=="4"){
        visibility1 = true;
        visibility2= true;
        visibility3 = true;
        visibility4 = true;
        visibility5 = false;

      }
      else if(eklenenalarmsayisi=="5"){
        visibility1 = true;
        visibility2= true;
        visibility3 = true;
        visibility4 = true;
        visibility5 = true;

      }
      else{
        visibility1 = true;
        visibility2= false;
        visibility3 = false;
        visibility4 = false;
        visibility5 = false;
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _adetvericekme();
  }
/*
 void boskalmasin() {


    setState(() {


        if(eklenenalarmsayisi=="2"){       Map<String, dynamic> sakirEkle = Map();

        sakirEkle['eklenenalarmsayisi'] = eklenenalarmsayisi;


        _firestore
            .collection("users")
            .doc("mehmet_sakir")
            .set(sakirEkle, SetOptions(merge: true))
            .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
        }
        else if(ilacsecim=="3"){
          Map<String, dynamic> sakirEkle = Map();

          sakirEkle['ilactipi'] = ilactip2;


          _firestore
              .collection("users")
              .doc("mehmet_sakir")
              .set(sakirEkle, SetOptions(merge: true))
              .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
        }
        else if(ilacsecim=="4"){
          Map<String, dynamic> sakirEkle = Map();

          sakirEkle['ilactipi'] = ilactip3;


          _firestore
              .collection("users")
              .doc("mehmet_sakir")
              .set(sakirEkle, SetOptions(merge: true))
              .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
        }
else {

        }

        // Navigator.pop(context);
        //TestSonucAlert(alarmsecim);


    });
  }
 */










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
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        "${ilacisim}",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        "Tip:$ilactipi \nAlarm adet:$adet",
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/diyabetsaatler');
                      },
                    ),
                  ),
                ) : new Container(),
                Divider(color: Colors.blueGrey, indent: 2, height: 12),
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
                        "",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        "",
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                ) : new Container(),
                Divider(color: Colors.blueGrey, indent: 2, height: 12),
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
                        "",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        " ",
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                ): new Container(),
                Divider(color: Colors.blueGrey, indent: 2, height: 12),
                visibility4 ? Container(
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
                        "",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        "",
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                ): new Container(),
                Divider(color: Colors.blueGrey, indent: 2, height: 12),
                visibility5 ? Container(

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
                        "",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(
                        "",
                        style: TextStyle(fontSize: 15),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                ): new Container(),
                Divider(color: Colors.blueGrey, indent: 2, height: 12),
              ],
            ),
            RaisedButton(
                color: Colors.blueGrey,
                child:  Text("Kapat",style: TextStyle(color: Colors.white),),

                onPressed: () {

                  // Navigator.pop(context);
                  _changed(false, "bir");
                  _changed(false, "iki");
                  _changed(false, "uc");
                  _changed(false, "dort");
                  _changed(false, "bes");
                  // Navigator.push(
                  //   context,
                  // MaterialPageRoute(
                  //   builder: (context) => DiyabetSupheTesti()));
                }),
            RaisedButton(
                color: Colors.blueGrey,
                child: Text("Aç",style: TextStyle(color: Colors.white),),

                onPressed: () {

                  // Navigator.pop(context);
                 _changed(true, "bir");
                 // visibility2 ? null : _changed(true, "iki");
                  //visibility3 ? null : _changed(true, "uc");
                  //visibility4 ? null : _changed(true, "dort");
                  //visibility5 ? null : _changed(true, "bes");
                  // Navigator.push(
                  //   context,
                  // MaterialPageRoute(
                  //   builder: (context) => DiyabetSupheTesti()));
                }),
            RaisedButton(
                color: Colors.blueGrey,
                child: Icon(
                  Icons.account_balance,
                  color: Colors.white,
                  size: 35.0,
                  semanticLabel: '',
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                  MaterialPageRoute(
                    builder: (context) => IlacAlarmi()));

                }),
            Container(
              margin: EdgeInsets.all(10),
alignment: Alignment.center,

              child: Text("Yeni İlaç ekle ",style: TextStyle(fontSize: 16,color: Colors.blueGrey,),),
            ),
          ],
        )
    );
  }

}




