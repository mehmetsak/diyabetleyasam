import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diyabetle_yasam/diyabet_saatler.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class IlacAlarmi extends StatefulWidget {
  @override
 IlacAlarmiState createState() => new IlacAlarmiState();
}

class IlacAlarmiState extends State< IlacAlarmi> {
int adet1=1;
int adet2=2;
int adet3=3;
String ilactip1="İğne";
String ilactip2="Hap";
String ilactip3="Diğer";

  int secim1 = 0,
   secim0 = 0;
  int  w1 = 0,
      w2 = 0,
      w3 = 0,
      s1=0,
  s2=0,
  s3=0;
  int alarmsecim=0;
  int ilacsecim=0;
  String boskalmasinmesaj="";
  final TextEditingController ilacisim = TextEditingController();



  void boskalmasin() {


    setState(() {
      alarmsecim = s1 +
        s2 +
        s3 ;
ilacsecim=w1+w2+w3;

      if (secim0 != 0 &&
          secim1 != 0
         ) {
        debugPrint("boskalmasina giriş yapıldı");

if(ilacsecim==0){       Map<String, dynamic> sakirEkle = Map();

sakirEkle['ilactipi'] = ilactip1;


_firestore
    .collection("users")
    .doc("mehmet_sakir")
    .set(sakirEkle, SetOptions(merge: true))
    .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
}
else if(ilacsecim==1){
  Map<String, dynamic> sakirEkle = Map();

  sakirEkle['ilactipi'] = ilactip2;


  _firestore
      .collection("users")
      .doc("mehmet_sakir")
      .set(sakirEkle, SetOptions(merge: true))
      .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
}
else{
  Map<String, dynamic> sakirEkle = Map();

  sakirEkle['ilactipi'] = ilactip3;


  _firestore
      .collection("users")
      .doc("mehmet_sakir")
      .set(sakirEkle, SetOptions(merge: true))
      .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
}

if(alarmsecim==0){

           Map<String, dynamic> sakirEkle = Map();

           sakirEkle['adet'] = adet1;
           sakirEkle['ilacisim'] ="${ilacisim.text}";

           _firestore
               .collection("users")
               .doc("mehmet_sakir")
               .set(sakirEkle, SetOptions(merge: true))
               .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
        }
        else  if(alarmsecim==1){
           Map<String, dynamic> sakirEkle = Map();

           sakirEkle['adet'] = adet2;
           sakirEkle['ilacisim'] = "${ilacisim.text}";

           _firestore
               .collection("users")
               .doc("mehmet_sakir")
               .set(sakirEkle, SetOptions(merge: true))
               .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
         }
        else{  Map<String, dynamic> sakirEkle = Map();

         sakirEkle['adet'] = adet3;
         sakirEkle['ilacisim'] ="${ilacisim.text}" ;

         _firestore
             .collection("users")
             .doc("mehmet_sakir")
             .set(sakirEkle, SetOptions(merge: true))
             .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));}


        Navigator.pop(context);
        Navigator.pushNamed(context, '/diyabetsaatler');
        // Navigator.pop(context);
        //TestSonucAlert(alarmsecim);
      }
      else
        {
        boskalmasinmesaj = "(Lütfen Boşluk Bırakmayınız)";
        debugPrint("Lütfen Boşluk Bırakmayınız");
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

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
          physics: const AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            Column(

              children: <Widget>[

                Padding(padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: ilacisim,


                    decoration: InputDecoration(
                      hintText: "İlaç",
                      labelText: "İlaç Adı:",

                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),),

                      prefixIcon: Icon(Icons.edit,color: Colors.blueGrey,),

                      filled: true,
                      // fillColor: Colors.red.shade50,
                    ),
                    maxLengthEnforced: true,

                    cursorColor:Colors.pink ,
                  ),
                ),

                Divider(color: Colors.blueGrey, indent: 2, height: 12),
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.all(5),
                  child: Text(
                    " İlaç Türünüz:",
                    textAlign: TextAlign.center,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                RadioListTile<int>(
                  value: 11,
                  groupValue: secim1,
                  onChanged: (deger) {
                    setState(() {
                      secim1 = 1;
                      secim1 = deger;
                      w1 = 0;
                      w2 = 0;
                      w3 = 0;
                      debugPrint("w1: $w1 w2: $w2 w3: $w3 ");
                    });
                  },
                  title: Text("İğne"),
                ),
                RadioListTile<int>(
                  value: 22,
                  groupValue: secim1,
                  onChanged: (deger) {
                    setState(() {
                      secim1 = 1;
                      secim1 = deger;
                      w1 = 0;
                      w2 = 1;
                      w3 = 0;
                      debugPrint("w1: $w1 w2: $w2 w3: $w3 ");
                    });
                  },
                  title: Text("Hap"),
                ),
                RadioListTile<int>(
                  value: 33,
                  groupValue: secim1,
                  onChanged: (deger) {
                    setState(() {
                      secim1 = 1;
                      secim1 = deger;
                      w1 = 0;
                      w2 = 0;
                      w3 = 3;
                      debugPrint("w1: $w1 w2: $w2 w3: $w3 ");
                    });
                  },
                  title: Text("Diğer"),
                ),
                Divider(color: Colors.blueGrey, indent: 2, height: 12),


                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.all(5),
                  child: Text(
                    " Alarm Sayısını Seçiniz",
                    textAlign: TextAlign.center,
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                RadioListTile<int>(
                  value: 11,
                  groupValue: secim0,
                  onChanged: (deger) {
                    setState(() {
                      secim0 = 1;
                      secim0 = deger;
                      s1 = 0;
                      s2 = 0;
                      s3 = 0;
                      debugPrint("w1: $s1 w2: $s2 w3: $s3 ");
                    });
                  },
                  title: Text("1"),
                ),
                RadioListTile<int>(
                  value: 22,
                  groupValue: secim0,
                  onChanged: (deger) {
                    setState(() {
                      secim0 = 1;
                      secim0 = deger;
                      s1 = 0;
                      s2 = 1;
                      s3 = 0;
                      debugPrint("s1: $s1 s2: $s2 s3: $s3 ");
                    });
                  },
                  title: Text("2"),
                ),
                RadioListTile<int>(
                  value: 33,
                  groupValue: secim0,
                  onChanged: (deger) {
                    setState(() {
                      secim0 = 1;
                      secim0 = deger;
                      s1 = 0;
                      s2 = 0;
                      s3 = 3;
                      debugPrint("s1: $s1 s2: $s2 s3: $s3 ");
                    });
                  },
                  title: Text("3"),
                ),


                RaisedButton(
                      color: Colors.blueGrey,



                    child: Text("Devam",
                        style: TextStyle(color: Colors.white, fontSize: 16



                        )),

                    onPressed:(){boskalmasin();

                      }





                    // Navigator.pushReplacementNamed(context, '/anamenu');
                  ),
                RaisedButton(
                    color: Colors.red,



                    child: Text("İptal",
                        style: TextStyle(color: Colors.white, fontSize: 16



                        )),

                    onPressed:(){    Navigator.pop(context);

                    }





                  // Navigator.pushReplacementNamed(context, '/anamenu');
                ),

                Text(
                  "$boskalmasinmesaj",
                  style: TextStyle(color: Colors.red),
                ),

              ],
            ),



          ],
        )

    );
  }


}
