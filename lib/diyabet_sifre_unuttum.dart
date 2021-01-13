import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Diyabetsifre extends StatefulWidget {
  @override
  _Diyabetsifre createState() => _Diyabetsifre();
}

class _Diyabetsifre extends State<Diyabetsifre> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emaill = TextEditingController();
  FocusNode _fnode;

  @override
  void initState() {
    super.initState();
    _fnode=FocusNode();

  }
  @override
  void dispose() {
    _fnode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diyabet Şifre"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: emaill,
              keyboardType: TextInputType.emailAddress,

              textInputAction: TextInputAction.go,
              autofocus: true,
              maxLines: 1,
              //  maxLength: 11,
              decoration: InputDecoration(
                hintText: "Örn: se*******@gmail.com",
                labelText: "Mail:",

                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),),

                prefixIcon: Icon(Icons.assignment_ind,color:  Colors.blueGrey,),

                filled: true,
                // fillColor: Colors.red.shade50,
              ),

              cursorColor:Colors.pink ,
            ),
          ),
          Container(

            color: Colors.blueGrey,
            margin: EdgeInsets.all(10),

            child: RaisedButton(

              child: Text("Onay"),

              onPressed:_resetsifre,


              // Navigator.pushReplacementNamed(context, '/anamenu');
            ),
          ),
        ],

      ),
    );
  }

  void _resetsifre() async{
    String _email=emaill.text;

    try{
      await _auth.sendPasswordResetEmail(email: _email);
      debugPrint("Resetleme maili gönderildi");
      TestSonucAlert();
    }
    catch(e){
      debugPrint("Şifre resetlenirken hata $e");
      TestSonucAlerthata();
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
          "İşleminiz Gerçekleşti",
          style: TextStyle(color: Colors.blueGrey, fontSize: 20),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Divider(color: Colors.blueGrey, indent: 2, height: 12),
              Container(
                margin: EdgeInsets.all(7),
                child: Text(
                  "\n Not:(Mail'inize gelen linke tıklayıp yeni şifrenizi girebilirsiniz)  ",
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
  void TestSonucAlerthata(

      ) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          "Böyle bir üye bulunmamaktadır.",
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
                Navigator.pushReplacementNamed(context, '/sifre');
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
/*


 */