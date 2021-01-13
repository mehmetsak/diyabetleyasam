import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'diyabet_ana_menu.dart';
import 'diyabet_suphe_testi.dart';

class DiyabetSupheTestilogin extends StatefulWidget {
  @override
  _DiyabetSupheTestiState createState() => _DiyabetSupheTestiState();
}

class _DiyabetSupheTestiState extends State<DiyabetSupheTestilogin> {
  int secim0 = 0,
      secim1 = 0,
      secim2 = 0,
      secim3 = 0,
      secim4 = 0,
      secim5 = 0,
      secim6 = 0,
      secim7 = 0;
  int q1 = 0,
      q2 = 0,
      q3 = 0,
      q4 = 0,
      w1 = 0,
      w2 = 0,
      w3 = 0,
      e1 = 0,
      e2 = 0,
      e3 = 0,
      r1 = 0,
      r2 = 0,
      t1 = 0,
      t2 = 0,
      u1 = 0,
      u2 = 0,
      p1 = 0,
      p2 = 0,
      m1 = 0,
      m2 = 0,
      m3 = 0;
  int sayac = 0;
  num kilo, boy, sonuc;

  //final kilo = TextEditingController();
  //final boy = TextEditingController();
  //final sonuc = TextEditingController();
  String boskalmasinmesaj = "";
  double sonuc1;
  String risk;
  int onyillikrisk = 0;
  TextEditingController l1 = TextEditingController();
  TextEditingController l2 = TextEditingController();

  testson() {
    setState(() {
      sayac = q1 +
          q2 +
          q3 +
          q4 +
          w1 +
          w2 +
          w3 +
          e1 +
          e2 +
          e3 +
          r1 +
          r2 +
          t1 +
          t2 +
          u1 +
          u2 +
          p1 +
          p2 +
          m1 +
          m2 +
          m3;

      if (sayac < 7) {
        risk = "Düşük";
        onyillikrisk = 1;
      } else if (7 < sayac && sayac < 12) {
        risk = "Hafif";
        onyillikrisk = 4;
      } else if (12 <= sayac && sayac <= 14) {
        risk = "Orta";
        onyillikrisk = 16;
      } else if (15 <= sayac && sayac <= 20) {
        risk = "Yüksek";
        onyillikrisk = 33;
      } else if (20 < sayac) {
        risk = "Çok Yüksek";
        onyillikrisk = 50;
      }
    });
  }

  void boskalmasin() {
    setState(() {
      if (secim0 != 0 &&
          secim1 != 0 &&
          secim2 != 0 &&
          secim3 != 0 &&
          secim4 != 0 &&
          secim5 != 0 &&
          secim6 != 0 &&
          secim7 != 0) {
        //
        boskalmasinmesaj = "";
        debugPrint("boskalmasina giriş yapıldı");
        // Navigator.pop(context);
        TestSonucAlert(onyillikrisk, risk);
      } else {
        boskalmasinmesaj = "(Lütfen bütün soruları işaretleyiniz)";
      }
    });
  }

  islem() {
    setState(() {
      kilo = num.parse(l2.text);
      boy = num.parse(l1.text);
      sonuc = (kilo / (boy * boy)) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: Text(
          "Şüphe Testi",
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
/*
Container(child: new RaisedButton(
  color: Colors.white,
    child: Icon(
      Icons.assignment_ind,
      color: Colors.blueGrey,
    ),
    onPressed: () {
      onyillikrisk=0;
      risk="";
      sonuc=0;
      Navigator.pop(context);
      Navigator.pushNamed(context, '/Login');
      // Navigator.push(
      //   context,
      // MaterialPageRoute(
      //   builder: (context) => DiyabetSupheTesti()));
    }),),
 */
              Container(
                child: Text("Login ",style: TextStyle(fontSize: 16,color: Colors.blueGrey),),
              ),
              RaisedButton(
                color: Colors.blueGrey,
                  child: Icon(
                    Icons.assignment_ind,
                    color: Colors.white,
                    size: 30.0,
                    semanticLabel: '',
                  ),
                  onPressed: () {

                   // Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/Login');
                    // Navigator.push(
                    //   context,
                    // MaterialPageRoute(
                    //   builder: (context) => DiyabetSupheTesti()));
                  }),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(5),
                child: Text(
                  "1.Yaş aralığı       ", textAlign: TextAlign.center,
                  //  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              RadioListTile<int>(
                value: 1,
                groupValue: secim0,
                onChanged: (deger) {
                  setState(() {
                    secim0 = 1;
                    secim0 = deger;
                    q1 = 0;
                    q2 = 0;
                    q3 = 0;
                    q4 = 0;
                    debugPrint("q1: $q1 q2: $q2 q3: $q3 q4: $q4  ");
                  });
                },
                title: Text("<45"),
              ),
              RadioListTile<int>(
                value: 2,
                groupValue: secim0,
                onChanged: (deger) {
                  setState(() {
                    secim0 = 1;
                    secim0 = deger;
                    q1 = 0;
                    q2 = 2;
                    q3 = 0;
                    q4 = 0;
                    debugPrint("q1: $q1 q2: $q2 q3: $q3 q4: $q4  ");
                  });
                },
                title: Text("45-54"),
              ),
              RadioListTile<int>(
                value: 3,
                groupValue: secim0,
                onChanged: (deger) {
                  setState(() {
                    secim0 = 1;
                    secim0 = deger;
                    q1 = 0;
                    q2 = 0;
                    q3 = 3;
                    q4 = 0;
                    debugPrint("q1: $q1 q2: $q2 q3: $q3 q4: $q4  ");
                  });
                },
                title: Text("55-65"),
              ),
              RadioListTile<int>(
                value: 4,
                groupValue: secim0,
                onChanged: (deger) {
                  setState(() {
                    secim0 = 1;
                    secim0 = deger;
                    q1 = 0;
                    q2 = 0;
                    q3 = 0;
                    q4 = 4;
                    debugPrint("q1: $q1 q2: $q2 q3: $q3 q4: $q4  ");
                  });
                },
                title: Text(">65"),
              ),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(5),
                child: Text(
                  "2.Beden kitle indeksi(BKİ)\n (Not:Bilmiyorsanız 'Hızlı hesap' butonuna\n tıklayıp kısa sürede öğrenebilirsiniz.)      ",
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              RaisedButton(
                child: Text("Hızlı hesap",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                color: Colors.blueGrey,
                onPressed: _showDialog,
              ),
              Text("$sonuc:kg/m²"),
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
                title: Text("<25 kg/m²"),
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
                title: Text("25-30 kg/m²"),
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
                title: Text(">30 kg/m²"),
              ),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(5),
                child: Text(
                  "3.Bel çevresi      ", textAlign: TextAlign.center,
                  //  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              RadioListTile<int>(
                value: 111,
                groupValue: secim2,
                onChanged: (deger) {
                  setState(() {
                    secim2 = 1;
                    secim2 = deger;
                    e1 = 0;
                    e2 = 0;
                    e3 = 0;
                  });
                },
                title: Text("ERKEK(<94 cm),KADIN(<80 cm)"),
              ),
              RadioListTile<int>(
                value: 222,
                groupValue: secim2,
                onChanged: (deger) {
                  setState(() {
                    secim2 = 1;
                    secim2 = deger;
                    e1 = 0;
                    e2 = 3;
                    e3 = 0;
                  });
                },
                title: Text("ERKEK(94-102 cm),KADIN(80-88 cm)"),
              ),
              RadioListTile<int>(
                value: 333,
                groupValue: secim2,
                onChanged: (deger) {
                  setState(() {
                    secim2 = 1;
                    secim2 = deger;
                    e1 = 0;
                    e2 = 0;
                    e3 = 4;
                  });
                },
                title: Text("ERKEK(>102),KADIN(>88)"),
              ),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(5),
                child: Text(
                  "4.Çoğunlukla günde en az 30 dakika egzersiz yapıyor musunuz?     ",
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              RadioListTile<int>(
                value: 1111,
                groupValue: secim3,
                onChanged: (deger) {
                  setState(() {
                    secim3 = 1;
                    secim3 = deger;
                    r1 = 0;
                    r2 = 0;
                  });
                },
                title: Text("Evet"),
              ),
              RadioListTile<int>(
                value: 2222,
                groupValue: secim3,
                onChanged: (deger) {
                  setState(() {
                    secim3 = 1;
                    secim3 = deger;
                    r1 = 0;
                    r2 = 2;
                  });
                },
                title: Text("Hayır"),
              ),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(5),
                child: Text(
                  "5.Hangi sıklıkla meyve-sebze tüketiyorsunuz?     ",
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              RadioListTile<int>(
                value: 11111,
                groupValue: secim4,
                onChanged: (deger) {
                  setState(() {
                    secim4 = 1;
                    secim4 = deger;
                    t1 = 0;
                    t2 = 0;
                  });
                },
                title: Text("Her gün"),
              ),
              RadioListTile<int>(
                value: 22222,
                groupValue: secim4,
                onChanged: (deger) {
                  setState(() {
                    secim4 = 1;
                    secim4 = deger;
                    t1 = 0;
                    t2 = 1;
                  });
                },
                title: Text("Her gün değil"),
              ),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(5),
                child: Text(
                  "6.Kan basıncı yükseltmek için hiç ilaç kullandınız mı ve sizde yüksek tansiyon bulundu mu?",
                  textAlign: TextAlign.center,
                  //overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              RadioListTile<int>(
                value: 111111,
                groupValue: secim5,
                onChanged: (deger) {
                  setState(() {
                    secim5 = 1;
                    secim5 = deger;
                    u1 = 2;
                    u2 = 0;
                  });
                },
                title: Text("Evet"),
              ),
              RadioListTile<int>(
                value: 222222,
                groupValue: secim5,
                onChanged: (deger) {
                  setState(() {
                    secim5 = 1;
                    secim5 = deger;
                    u1 = 0;
                    u2 = 0;
                  });
                },
                title: Text("Hayır"),
              ),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(5),
                child: Text(
                  "7.Daha önce (check-up,hastalık veya gebelik sırasında) kan şekerinizin yüksek olduğu veya sınırda olduğu size söylendi mi?",
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              RadioListTile<int>(
                value: 1111111,
                groupValue: secim6,
                onChanged: (deger) {
                  setState(() {
                    secim6 = 1;
                    secim6 = deger;
                    p1 = 5;
                    p2 = 0;
                  });
                },
                title: Text("Evet"),
              ),
              RadioListTile<int>(
                value: 2222222,
                groupValue: secim6,
                onChanged: (deger) {
                  setState(() {
                    secim6 = 1;
                    secim6 = deger;
                    p1 = 0;
                    p2 = 0;
                  });
                },
                title: Text("Hayır"),
              ),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(10),
                child: Text(
                  "8.Aile bireylerinizden herhangi birisine diyabet tanısı konulmuş muydu?",
                  textAlign: TextAlign.center,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              RadioListTile<int>(
                value: 11111111,
                groupValue: secim7,
                onChanged: (deger) {
                  setState(() {
                    secim7 = 1;
                    secim7 = deger;
                    m1 = 0;
                    m2 = 0;
                    m3 = 0;
                  });
                },
                title: Text("Hayır"),
              ),
              RadioListTile<int>(
                value: 22222222,
                groupValue: secim7,
                onChanged: (deger) {
                  setState(() {
                    secim7 = 1;
                    secim7 = deger;
                    m1 = 0;
                    m2 = 3;
                    m3 = 0;
                  });
                },
                title: Text("Evet ikinci derece yakınlar(amca,teyze vb.)"),
              ),
              RadioListTile<int>(
                value: 33333333,
                groupValue: secim7,
                onChanged: (deger) {
                  setState(() {
                    secim7 = 1;
                    secim7 = deger;
                    m1 = 0;
                    m2 = 0;
                    m3 = 5;
                  });
                },
                title: Text(
                    "Evet birinci derece yakınlar(anne,baba,kardeş,çocuk)"),
              ),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              RaisedButton(
                  child: Text("Testi Bitir",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  color: Colors.blueGrey,
                  onPressed: () {
                    testson();
                    boskalmasin();

                    //  TestSonucAlert(onyillikrisk,risk);
                    debugPrint("Toplam: $sayac");
                    debugPrint(
                        "Secim0: $secim0,Secim1: $secim1,Secim2: $secim2,Secim3: $secim3,Secim4: $secim4,Secim5: $secim5,Secim6: $secim6 ,Secim7: $secim7");
                  }),
              Text(
                "$boskalmasinmesaj",
                style: TextStyle(color: Colors.red),
              ),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
            ],
          ),
        ],
      ),
    );
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                controller: l1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: "Boy(m)",
                  hintText: "Örn: 1.75",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),

                  filled: true,
                  // fillColor: Colors.red.shade50,
                ),
                maxLengthEnforced: true,
              ),
            ),
            new Expanded(
              child: new TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.go,
                controller: l2,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: "Kilo(kg)",
                  hintText: "Örn: 55",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),

                  filled: true,
                  // fillColor: Colors.red.shade50,
                ),
                maxLengthEnforced: true,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('Kapat'),
              onPressed: () {
                Navigator.pop(context);
              }),
          RaisedButton(
            onPressed: () {
              islem();
              Navigator.pop(context);
            },
            child: Text("Hesapla"),
          ),
        ],
      ),
    );
  }

  void TestSonucAlert(
    int,
    String,
  ) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          "Diyabetle Yaşam Şüphe Testi",
          style: TextStyle(color: Colors.blueGrey, fontSize: 20),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                margin: EdgeInsets.all(7),
                child: Text(
                  "10 yıl içerisinde diyabet olma yüzdeliğiniz:  ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(7),
                child: Text(
                  "%$onyillikrisk ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
              ),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                margin: EdgeInsets.all(7),
                child: Text(
                  "Diyabet olma riskiniz: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(7),
                child: Text(
                  "$risk ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
              ),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                // margin: EdgeInsets.all(10),
                child: Text(
                  "(UYARI: Diyabet olma riskinize göre, teşhis konması için bir sağlık kuruluşuna gitmeyi ihmal etmeyin!)  ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900),
                ),
              ),
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
            ],
          ),
        ),
        actions: <Widget>[
          RaisedButton(
              child: Icon(
                Icons.assignment_ind,
              ),
              onPressed: () {
                onyillikrisk = 0;
                risk = "";
                sonuc = 0;
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/Login');
                // Navigator.push(
                //   context,
                // MaterialPageRoute(
                //   builder: (context) => DiyabetSupheTesti()));
              }),
          RaisedButton(
              child: Icon(
                Icons.refresh,
              ),
              onPressed: () {
                onyillikrisk = 0;
                risk = "";
                sonuc = 0;
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/Loginsuphetest');
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
