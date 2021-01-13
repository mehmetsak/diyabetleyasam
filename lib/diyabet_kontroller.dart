import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {

      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blueGrey,
      ),
      home:DiyabetKontroller(),
    );
  }}


class DiyabetKontroller extends StatefulWidget {
  @override
  _DiyabetKontrollerState createState() => new _DiyabetKontrollerState();
}

class _DiyabetKontrollerState extends State< DiyabetKontroller> {

  @override
  Future _verilerinokunmasi() async {
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
      hipergirilenilk= documentSnapshot.data()['hipergirilenilk'].toString();
      hipersontarih= documentSnapshot.data()['hipersontarih'].toString();
      ayakgirilenilk= documentSnapshot.data()['ayakgirilenilk'].toString();
      ayaksontarih= documentSnapshot.data()['ayaksontarih'].toString();
      gozgirilenilk= documentSnapshot.data()['gozgirilenilk'].toString();
      gozsontarih= documentSnapshot.data()['gozsontarih'].toString();
      bobrekgirilenilk= documentSnapshot.data()['bobrekgirilenilk'].toString();
      bobreksontarih= documentSnapshot.data()['bobreksontarih'].toString();
    });
  }
  DateTime suan = DateTime.now();
  DateTime oncesi ;
  DateTime sonrasi ;
  DateTime secilmis ;
  var ayakgirilenilk;
  var ayakdondurme;
  var ayaksontarih;
  var gozgirilenilk;
  var gozdondurme;
  var gozsontarih;
  var bobrekgirilenilk;
  var bobrekdondurme;
  var bobreksontarih;
  var hipergirilenilk;
  var hiperdondurme;
  var hipersontarih;
  Future _evet(List<String> args) async {
    //tek bir dökümanın okunması
    Set<String> veriler =Set();
    for (String s1 in veriler){}
    DocumentSnapshot documentSnapshot =
    await _firestore.doc("users/mehmet_sakir").get();

    documentSnapshot.data().forEach((key, deger) {
      debugPrint("key : $key deger :deger");
      hipergirilenilk= documentSnapshot.data()['hipergirilenilk'].toString();
      hipersontarih= documentSnapshot.data()['hipersontarih'].toString();
      ayakgirilenilk= documentSnapshot.data()['ayakgirilenilk'].toString();
      ayaksontarih= documentSnapshot.data()['ayaksontarih'].toString();
      gozgirilenilk= documentSnapshot.data()['gozgirilenilk'].toString();
      gozsontarih= documentSnapshot.data()['gozsontarih'].toString();
      bobrekgirilenilk= documentSnapshot.data()['bobrekgirilenilk'].toString();
      bobreksontarih= documentSnapshot.data()['bobreksontarih'].toString();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    oncesi = DateTime(suan.year-10, suan.month, suan.day);
    sonrasi = DateTime(suan.year, suan.month, suan.day+1);
    super.initState();

_verilerinokunmasi();



  }
  @override
  Widget build(BuildContext context) {


    ayakislem() {
      setState(() {
        showDatePicker(context: context, initialDate: suan, firstDate:oncesi , lastDate: sonrasi).then((secilen1){
          debugPrint(secilen1.toString());
          debugPrint(secilen1.add(Duration(days: 365)).toString());

          //  var yeniDate=DateTime.parse(secilen1.toUtc().toIso8601String());
        //debugPrint()  ;
          if(suan.year<=secilen1.year){

            ayakgirilenilk= (formatDate(secilen1, [yyyy, '-', mm, '-', dd]));
            ayakdondurme=secilen1.add(Duration(days: 365));
            ayaksontarih= (formatDate(ayakdondurme, [yyyy, '-', mm, '-', dd]));




          }
          else{
            ayakgirilenilk= (formatDate(secilen1, [yyyy, '-', mm, '-', dd]));
            ayaksontarih=suan;


          }
        }
        );
      });

    }
    gozislem() {
      setState(() {
        showDatePicker(context: context, initialDate: suan, firstDate:oncesi , lastDate: sonrasi).then((secilen1){
          debugPrint(secilen1.toString());
          debugPrint(secilen1.add(Duration(days: 365)).toString());

          //  var yeniDate=DateTime.parse(secilen1.toUtc().toIso8601String());
          //debugPrint()  ;
          if(suan.year<=secilen1.year){

            gozgirilenilk= (formatDate(secilen1, [yyyy, '-', mm, '-', dd]));
            gozdondurme=secilen1.add(Duration(days: 365));
            gozsontarih= (formatDate(gozdondurme, [yyyy, '-', mm, '-', dd]));

          }
          else{
            gozgirilenilk= (formatDate(secilen1, [yyyy, '-', mm, '-', dd]));
            gozsontarih=suan;
          }
        }
        );
      });
    }
    bobrekislem() {
      setState(() {
        showDatePicker(context: context, initialDate: suan, firstDate:oncesi , lastDate: sonrasi).then((secilen1){
          debugPrint(secilen1.toString());
          debugPrint(secilen1.add(Duration(days: 365)).toString());

          //  var yeniDate=DateTime.parse(secilen1.toUtc().toIso8601String());
          //debugPrint()  ;
          if(suan.year<=secilen1.year){

            bobrekgirilenilk= (formatDate(secilen1, [yyyy, '-', mm, '-', dd]));
            bobrekdondurme=secilen1.add(Duration(days: 365));
            bobreksontarih= (formatDate(bobrekdondurme, [yyyy, '-', mm, '-', dd]));

          }
          else{
            bobrekgirilenilk= (formatDate(secilen1, [yyyy, '-', mm, '-', dd]));
            bobreksontarih=suan;
          }
        }
        );
      });
    }
    hipertansiyonislem() {
      setState(() {
        showDatePicker(context: context, initialDate: suan, firstDate:oncesi , lastDate: sonrasi).then((secilen1){
          debugPrint(secilen1.toString());
          debugPrint(secilen1.add(Duration(days: 365)).toString());

          //  var yeniDate=DateTime.parse(secilen1.toUtc().toIso8601String());
          //debugPrint()  ;
          if(suan.year<=secilen1.year){

            hipergirilenilk= (formatDate(secilen1, [yyyy, '-', mm, '-', dd]));
            hiperdondurme=secilen1.add(Duration(days: 365));
            hipersontarih= (formatDate(hiperdondurme, [yyyy, '-', mm, '-', dd]));

          }
          else{
            hipergirilenilk= (formatDate(secilen1, [yyyy, '-', mm, '-', dd]));
            hipersontarih=(formatDate(suan, [yyyy, '-', mm, '-', dd]));
          }
        }
        );
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Diyabet Kontrol Tarih",
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
                            Icons.airline_seat_legroom_extra,

                          )),
                      title: Text(
                        "Ayak Muayene Tarihi ",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(

                        "En son muayene: \n $ayakgirilenilk \n Muayene olmanız gereken:\n $ayaksontarih ",
                        style: TextStyle(fontSize: 19),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                ),
                RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.event,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed:(){setState(() {
                      ayakislem();
                    });} ),
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
                            Icons.remove_red_eye,

                          )),
                      title: Text(
                        "Göz Muayene Tarihi",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(

                        "En son muayene: \n $gozgirilenilk \n Muayene olmanız gereken:\n $gozsontarih ",
                        style: TextStyle(fontSize: 19),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                ),
                RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.event,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed:(){setState(() {
                      gozislem();
                    });} ),
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
                            Icons.local_hospital,

                          )),
                      title: Text(
                        "Böbrek Muayene Tarihi ",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(

                        "En son muayene: \n $bobrekgirilenilk \n Muayene olmanız gereken:\n $bobreksontarih ",
                        style: TextStyle(fontSize: 19),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                ),
                RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.event,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed:(){setState(() {
                      bobrekislem();
                    });} ),
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
                            Icons.trending_up,

                          )),
                      title: Text(
                        "Hipertansiyon Muayene Tarihi",
                        style: TextStyle(fontSize: 22),
                      ),
                      subtitle: Text(

                        "En son muayene: \n $hipergirilenilk \n Muayene olmanız gereken:\n $hipersontarih ",
                        style: TextStyle(fontSize: 16),
                      ),
                      onTap: () {

                      },
                    ),
                  ),
                ),
                RaisedButton(
                    color: Colors.blueGrey,
                    child: Icon(
                      Icons.event,
                      color: Colors.white,
                      size: 35.0,
                      semanticLabel: '',
                    ),

                    onPressed:(){setState(() {
                      hipertansiyonislem();
                    });} ),
                RaisedButton(
                    color: Colors.blueGrey,
                    child: Text("Değişiklik Yaptım Kaydet & Kaydet",style: TextStyle(color: Colors.white),),

                    onPressed:(){
                      _ayakEkle();
                      _hiperEkle();
                      _bobrekEkle();
                      _gozEkle();
                      TestSonucAlerthata();


                    }),

              ],
            ),



          ],
        )
    );
  }
  void TestSonucAlerthata(

      ) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          "Kaydıt Başarılı.",
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
              //  Navigator.pushReplacementNamed(context, '/Login');
                // Navigator.push(
                //   context,
                // MaterialPageRoute(
                //   builder: (context) => DiyabetSupheTesti()));
              }),
        ],
      ),
    );
  }
  Future _ayakverioku() async {
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
     ayakgirilenilk= documentSnapshot.data()['ayakgirilenilk'].toString();
      ayaksontarih= documentSnapshot.data()['ayaksontarih'].toString();
    });
  }

  void _ayakEkle() {
    debugPrint("ayak fonksiyona girildi");
    Map<String, dynamic> sakirEkle = Map();
    sakirEkle['ad'] = "emre updated";
     sakirEkle['ayakgirilenilk'] = ayakgirilenilk;
    sakirEkle['ayaksontarih'] = ayaksontarih;


    _firestore
        .collection("users")
        .doc("mehmet_sakir")
        .set(sakirEkle, SetOptions(merge: true))
        .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
  }
  Future _gozverioku() async {
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
      gozgirilenilk= documentSnapshot.data()['gozgirilenilk'].toString();
      gozsontarih= documentSnapshot.data()['gozsontarih'].toString();
    });
  }

  void _gozEkle() {
    debugPrint("ayak fonksiyona girildi");
    Map<String, dynamic> sakirEkle = Map();

    sakirEkle['gozgirilenilk'] = gozgirilenilk;
    sakirEkle['gozsontarih'] = gozsontarih;


    _firestore
        .collection("users")
        .doc("mehmet_sakir")
        .set(sakirEkle, SetOptions(merge: true))
        .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
  }
  Future _bobrekverioku() async {
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
      bobrekgirilenilk= documentSnapshot.data()['bobrekgirilenilk'].toString();
      bobreksontarih= documentSnapshot.data()['bobreksontarih'].toString();
    });
  }

  void _bobrekEkle() {
    debugPrint("ayak fonksiyona girildi");
    Map<String, dynamic> sakirEkle = Map();

    sakirEkle['bobrekgirilenilk'] = bobrekgirilenilk;
    sakirEkle['bobreksontarih'] = bobreksontarih;


    _firestore
        .collection("users")
        .doc("mehmet_sakir")
        .set(sakirEkle, SetOptions(merge: true))
        .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
  }
  Future _hiperverioku() async {
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
      hipergirilenilk= documentSnapshot.data()['hipergirilenilk'].toString();
      hipersontarih= documentSnapshot.data()['hipersontarih'].toString();
    });
  }

  void _hiperEkle() {
    debugPrint("ayak fonksiyona girildi");
    Map<String, dynamic> sakirEkle = Map();

    sakirEkle['hipergirilenilk'] = hipergirilenilk;
    sakirEkle['hipersontarih'] =  hipersontarih;


    _firestore
        .collection("users")
        .doc("mehmet_sakir")
        .set(sakirEkle, SetOptions(merge: true))
        .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
  }
}

