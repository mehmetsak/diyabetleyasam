import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
class Loginislemleri extends StatefulWidget {
  @override
  _LoginislemleriState createState() => _LoginislemleriState();
}

class _LoginislemleriState extends State<Loginislemleri> {
  TextEditingController emaill1 = TextEditingController();
  TextEditingController sifree1 = TextEditingController();
  TextEditingController sifree2 = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth
        .authStateChanges()
        .listen((User user) {
      if (user == null) {
        print('Oturum kapıldı');
      } else {
        print('oturum açıldı');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kayıt Olma"),),
      body: Center(child: ListView(
          children: <Widget>[


            Padding(padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: emaill1,
                keyboardType: TextInputType.emailAddress,

                textInputAction: TextInputAction.go,
                autofocus: false,
                maxLines: 1,
                //  maxLength: 11,

                decoration: InputDecoration(
                  hintText: "Örn: se*******@gmail.com",
                  labelText: "Mail adresiniz",

                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),),

                  prefixIcon: Icon(Icons.assignment_ind,color: Colors.blue,),

                  filled: true,
                  // fillColor: Colors.red.shade50,
                ),

                cursorColor:Colors.pink ,
              ),
            ),

            Padding(padding: const EdgeInsets.all(16.0),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: sifree1,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.go,
                autofocus: false,

                decoration: InputDecoration(


                  hintText: "Şifre",
                  labelText: "Şifre",

                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),),

                  prefixIcon: Icon(Icons.edit,color: Colors.blue,),

                  filled: true,
                  // fillColor: Colors.red.shade50,
                ),
                maxLengthEnforced: true,

                cursorColor:Colors.pink ,
              ),
            ),Padding(padding: const EdgeInsets.all(16.0),
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: sifree2,
                textInputAction: TextInputAction.go,
                autofocus: false,

                decoration: InputDecoration(
                  hintText: "Tekrar Şifre",
                  labelText: "Tekrar Şifre",

                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),),

                  prefixIcon: Icon(Icons.edit,color: Colors.blue,),

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

                  child: Text("Kayıt Oluştur",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  color: Colors.blueGrey,
                  onPressed:_emailkullanici,
                  ),
            ),
            Container(

              color: Colors.blueGrey,
              margin: EdgeInsets.all(10),
              width: 10,
              height: 50,
              child: RaisedButton(

                child: Text("çıkış",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                color: Colors.blueGrey,
                onPressed:_cikis,

              ),
            ),
            Divider(color: Colors.blueGrey, indent: 2, height: 12),


          ]
      ),),
    );
  }
  void _emailkullanici() async {
    String _ebir = sifree2.text;
    String _eiki = sifree1.text;
   if(_ebir==_eiki){

       String _email = emaill1.text;
       String _password = sifree1.text;



     try{  UserCredential _credential= await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
     User _yeniuser=_credential.user;
     await _yeniuser.sendEmailVerification();
     TestSonucAlert();
     if(_auth.currentUser != null){
       debugPrint("mail onaylama");
       await _auth.signOut();
       debugPrint("oturumdan atıldı");
     }

     debugPrint(_yeniuser.toString());

     }catch(e){
       debugPrint("******** hata var********");
       debugPrint(e.toString());
     }
   }
    else {
      debugPrint("iki şifre birbirine uymuyor");
   }
  }
  void TestSonucAlert(

      ) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          "Kaydınız Başarıyla Oluşturulmuştur.",
          style: TextStyle(color: Colors.blueGrey, fontSize: 20),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                margin: EdgeInsets.all(7),
                child: Text(
                  "\n Not:(Mail'inize gelen onay linkine tıklayıp giriş yapabilirsiniz)  ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
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

  void _emailkullanicigiris() async {


    String _email = "aytac.atasayin@gmail.com";
    String _password = "123456";
    try{if(_auth.currentUser == null){


      User _oturumac =  (await _auth.signInWithEmailAndPassword(email: _email, password: _password)).user;

      if(_oturumac.emailVerified){
        debugPrint("mail onaylı ana sayfaya gidilir");
      }
      else{  debugPrint("lütfen maili onaylayın");
      _auth.signOut();
      }
    }else{ debugPrint("oturum zaten açık");}}
    catch(e)
    {debugPrint("hatavar");}


  }

  void _cikis() async {
    if(_auth.currentUser != null){

      await _auth.signOut();

    }else{ debugPrint("Zaten kapalı");}
  }

  void _resetsifre() async{
    String _email="mehmet.atasayin@gmail.com";

    try{
      await _auth.sendPasswordResetEmail(email: _email);
      debugPrint("Resetleme maili gönderildi");
    }
    catch(e){
      debugPrint("Şifre resetlenirken hata $e");
    }
  }
  void _sifreguncelle() async{
    String _email="mehmet.atasayin@gmail.com";

    try{
      await _auth.currentUser.updatePassword("1234567");
      debugPrint("sifre guncellendi");
    }
    catch(e){


// Create a credential
      try{String email = 'mehmet.atasayin@gmail.com';
      String password = '1234567';
      EmailAuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      await FirebaseAuth.instance.currentUser.reauthenticateWithCredential(credential);
      debugPrint("girilen eski mail şifresi doğru");
      await _auth.currentUser.updatePassword("1234567");
      debugPrint("Auth yeniden sağlandı şifre güncellendi");
      }
      catch(e){
        debugPrint("Hata çıktı $e");
      }

      debugPrint("Şifre guncellenirken hata olustu $e");
    }
  }
}
