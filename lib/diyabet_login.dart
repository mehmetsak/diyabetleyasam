
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'diyabet_ana_menu.dart';
import 'diyabet_suphe_testi.dart';
FirebaseAuth _auth = FirebaseAuth.instance;


class DiyabetLogin extends StatefulWidget {

  DiyabetLogin({Key key}) : super(key : key);

  @override

  _FormIslemleriState createState() => _FormIslemleriState();
}

class _FormIslemleriState extends State<DiyabetLogin> {
  final formKey = GlobalKey<FormState>();
  bool showPassword = false;
 final emaill1 = TextEditingController();
final sifree1 = TextEditingController();
  SharedPreferences logindata;
  bool newuser;
  String girilenmetin="";
  FocusNode _fnode;

  @override
  void initState() {
    super.initState();
    check_if_already_login();
    _fnode=FocusNode();

  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => DiyabetAnaMenu()));
    }
  }
  @override
  void dispose() {

    _fnode.dispose();
    // Clean up the controller when the widget is disposed.
    emaill1.dispose();
    sifree1.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
title: Text("Diyabetle Yaşam"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          FocusScope.of(context).requestFocus(_fnode);
        },child: Icon(Icons.account_balance),
      ),
      body:Center(child: ListView(
          children: <Widget>[


            Padding(padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: emaill1,
                keyboardType: TextInputType.emailAddress,

                textInputAction: TextInputAction.go,
                autofocus: false,
                maxLines: 1,
                //  maxLength: 11,
                focusNode: _fnode,
                decoration: InputDecoration(
                  hintText: "Örn: se*******@gmail.com:",
                  labelText: "Mail:",

                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),),

                  prefixIcon: Icon(Icons.assignment_ind,color:  Colors.blueGrey,),

                  filled: true,
                  // fillColor: Colors.red.shade50,
                ),

                cursorColor:Colors.pink ,
              ),
            ),

            Padding(padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: sifree1,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                autofocus: false,

                decoration: InputDecoration(
                  hintText: "Şifreniz",
                  labelText: "Şifre:",

                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),),

                  prefixIcon: Icon(Icons.edit,color: Colors.blueGrey,),

                  filled: true,
                  // fillColor: Colors.red.shade50,
                ),
                maxLengthEnforced: true,

                cursorColor:Colors.pink ,
              ),
            ),

            Container(

              color: Colors.blueGrey,
              margin: EdgeInsets.all(10),
              width: 10,
              height: 50,
              child: RaisedButton(

                  child: Text("Giriş",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                color: Colors.green.shade600,
                  onPressed:emailkullanicigiris,


                   // Navigator.pushReplacementNamed(context, '/anamenu');
                  ),
            ),
            Container(

              color: Colors.blueGrey,
              margin: EdgeInsets.all(10),
              width: 10,
              height: 50,
              child: RaisedButton(

                child: Text("Kayıt İşlemleri",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                  color: Colors.indigo,
                onPressed: () {
                  Navigator.pushNamed(context, '/kayitLoginislemleri');
                }
              ),
            ),
            Container(
              child: RaisedButton(


                  child: Text("(Şifremi Unuttum)",style: TextStyle(color: Colors.lightBlueAccent.shade200, fontSize: 11),
                  ),

                  onPressed: (){
                    Navigator.pushNamed(context, '/sifre');

                  }),
            ),
            Divider(color: Colors.blueGrey, indent: 2, height: 12),

            Container(
              child: Card(
                color: Colors.blueGrey,
                margin: EdgeInsets.all(10),
                elevation: 7,
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.check_circle_outline,
                      )),
                  title: Text("Şüphe Testi",style: TextStyle(fontSize: 22,color: Colors.white),),
                  subtitle: Text("Diyabet hastası olduğunuzdan şüpheleniyorsanız, lütfen bu testi çözün.",style: TextStyle(fontSize: 15,color: Colors.white70,),),
                  onTap: () {Navigator.pushReplacementNamed(context, '/Loginsuphetest');

                  },
                ),
              ),
            ),
            Container(
              child: Card(

                color: Colors.blueGrey,
                margin: EdgeInsets.all(10),
                elevation: 7,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.accessibility_new,
                      )),
                  title: Text("Öneriler",style: TextStyle(fontSize: 22,color: Colors.white),),
                  subtitle: Text("Sağlınıza faydalı olacağını düşündüğümüz beslenme ve egzersizler",style: TextStyle(fontSize: 15,color: Colors.white70),),
                  onTap: () {
                    Navigator.pushNamed(context, '/oneriler');
                  },
                ),
              ),
            ),
          ]
      ),),
    );


  }
  void emailkullanicigiris() async {
bool  autoValidate=false;

    String email = emaill1.text;
    String password = sifree1.text;

    try{if(_auth.currentUser == null){


      User oturumac =  (await _auth.signInWithEmailAndPassword(email: email, password: password)).user;

      if(oturumac.emailVerified){

        debugPrint("mail onaylı ana sayfaya gidilir");

       // Navigator.pushReplacementNamed(context, '/anamenu');
        String username = emaill1.text;
        String password = sifree1.text;
        if (username != '' && password != '') {
          print('Basarılı');
          logindata.setBool('login', false);
          logindata.setString('username', username);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DiyabetAnaMenu()));
        }
      }
      else{  debugPrint("lütfen maili onaylayın");
      _auth.signOut();
      }
    }else{ debugPrint("oturum zaten açık");
    String username = emaill1.text;
    String password = sifree1.text;
    if (username != '' && password != '') {
      print('Basarılı');
      logindata.setBool('login', false);
      logindata.setString('username', username);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DiyabetAnaMenu()));
    }
    }}
    catch(e)
    {debugPrint("hatavar $e ");
    debugPrint("$formKey");
    debugPrint("${formKey.currentState}");
    TestSonucAlerthata();

    }


  }
  /*
  void ilkgirisicin() async {


    try{if(_auth.currentUser == null){



    }else{

      debugPrint("oturum zaten açık");

    //  Navigator.pushReplacementNamed(context, '/anamenu');

    }}
    catch(e)
    {debugPrint("hatavar");}


  }
   */


  void TestSonucAlerthata(

      ) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          "Yanlış giriş!!\nTekrar deneyiniz",
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
                Navigator.pushReplacementNamed(context, '/Login');
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


