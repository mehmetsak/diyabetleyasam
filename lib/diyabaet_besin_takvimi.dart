import 'package:flutter/material.dart';
import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:custom_horizontal_calendar/custom_horizontal_calendar.dart';
import 'package:custom_horizontal_calendar/date_row.dart';
import 'bos2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String hadi;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;


class MyAppsa extends StatefulWidget {
  @override
  _MyAppsaState createState() => _MyAppsaState();
}

class _MyAppsaState extends State<MyAppsa> {
  final _sampleEvents = sampleEvents();
  int renk=0;

  DateTime chosen = DateTime.now();
   
  @override
  Widget build(BuildContext context) {

    final renk1=Colors.blue;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Besin Takvimi",
        ),
      ),
      body: ListView(
        children: <Widget>[
          CustomHorizontalCalendar(
            onDateChoosen: (date) {
              setState(() {
                chosen = date;
              });
            },
            inintialDate: DateTime.now(),
            height: 60,
            builder: (context, i, d, width) {
              if (i != 2)
                return DateRow(
                  d,
                  width: width,
                );
              else
                return DateRow(
                  d,
                  background: renk1,
                  selectedDayStyle: TextStyle(color: Colors.white),
                  selectedDayOfWeekStyle:
                  TextStyle(color: Colors.white),
                  selectedMonthStyle: TextStyle(color: Colors.white),
                  width: width,
                );
            },
          ),
          Text(
            DateFormat.yMd().format(chosen),
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
          RaisedButton(

            child: Text("Değerlendir",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            color: Colors.blueGrey,
            onPressed:(){TestSonucAlerthata();},
          ),
          RaisedButton(

            child: Text("Ajanda Aç",
                style: TextStyle(color: Colors.white, fontSize: 16)),
            color: Colors.blueGrey,
            onPressed:(){

              takvimAlerthata();},
          ),
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
          "Diyetisyen veya doktorunuza ne kadar uydunuz? ",
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
              RaisedButton(
                  color: Colors.greenAccent,
                  child: Icon(
                    Icons.sentiment_very_satisfied,
                  ),
                  onPressed: () {
                    setState(() {
                      renk=1;
                      ekle();

                      Navigator.pop(context);
                    });


                    // Navigator.push(
                    //   context,
                    // MaterialPageRoute(
                    //   builder: (context) => DiyabetSupheTesti()));
                  }),
              RaisedButton(
                  color: Colors.orange,
                  child: Icon(    Icons.sentiment_neutral,

                  ),
                  onPressed: () {
                    setState(() {
                      renk=2;
                      ekle();
                      Navigator.pop(context);
                    });


                  }),
              RaisedButton(
                  color: Colors.redAccent,
                  child: Icon(
                    Icons.sentiment_very_dissatisfied,
                  ),
                  onPressed: () {
                    setState(() {
                      renk=3;
                      ekle();
                      Navigator.pop(context);
                    });

                    // Navigator.push(
                    //   context,
                    // MaterialPageRoute(
                    //   builder: (context) => DiyabetSupheTesti()));
                  }),
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
                //   Navigator.pushReplacementNamed(context, '/Login');
                // Navigator.push(
                //   context,
                // MaterialPageRoute(
                //   builder: (context) => DiyabetSupheTesti()));
              }),
        ],
      ),
    );
  }
  void takvimAlerthata(

      ) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),

        content:  CellCalendar(
          events: _sampleEvents,
          onCellTapped: (date) {
            final eventsOnTheDate = _sampleEvents.where((event) {
              final eventDate = event.eventDate;
              return eventDate.year == date.year &&
                  eventDate.month == date.month &&
                  eventDate.day == date.day;
            }).toList();
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title:
                  Text(date.month.monthName + " " + date.day.toString()),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: eventsOnTheDate
                        .map(
                          (event) => Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.only(bottom: 12),
                        color: event.eventBackgroundColor,
                        child: Text(
                          event.eventName,
                          style: TextStyle(color: event.eventTextColor),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ));
          },
          onPageChanged: (firstDate, lastDate) {
            /// Called when the page was changed
            /// Fetch additional events by using the range between [firstDate] and [lastDate] if you want
          },
        ),
        actions: <Widget>[
          new RaisedButton(
              child: Icon(
                Icons.close,
              ),
              onPressed: () {

                Navigator.pop(context);
                //   Navigator.pushReplacementNamed(context, '/Login');
                // Navigator.push(
                //   context,
                // MaterialPageRoute(
                //   builder: (context) => DiyabetSupheTesti()));
              }),
        ],
      ),
    );
  }
  void ekle(){
    hadi=chosen.toString();
    debugPrint("${chosen.day} sen söyle");
    Map<String, dynamic> sakirEkle = Map();

    sakirEkle['color'] = "$renk";


    _firestore
        .collection("users")
        .doc("mehmet_sakir")
        .set(sakirEkle, SetOptions(merge: true))
        .then((v) => debugPrint("EKLENDİ DEVAM ETTTTT"));
  }
}



var renk;

@override
void initState() {
  // TODO: implement initState



  _adetvericekme();
}
@override
Future _adetvericekme() async {

  //tek bir dökümanın okunması
  DocumentSnapshot documentSnapshot =
  await _firestore.doc("users/mehmet_sakir").get();

  documentSnapshot.data().forEach((key, deger) {
    debugPrint("key : $key deger :deger");
    renk= documentSnapshot.data()['renk'].toString();

  });
}


List<CalendarEvent> sampleEvents() {
  debugPrint("$renk");
  final today = DateTime.now();


  final sampleEvents = [
    CalendarEvent(
      eventName: "",
      eventDate: today.add(Duration(days:0)),
      eventBackgroundColor: Colors.green,
    ),
    CalendarEvent(
      eventName: "",
      eventDate: today.add(Duration(days: -2)),
      eventBackgroundColor: Colors.redAccent,
    ),
    CalendarEvent(
      eventName: "",
      eventDate: today.add(Duration(days: -3)),
      eventBackgroundColor: Colors.orange,
    ),
    CalendarEvent(
      eventName: "",
      eventDate: today.add(Duration(days: -4)),
      eventBackgroundColor: Colors.green,
    ),
    CalendarEvent(
      eventName: "",
      eventDate: today.add(Duration(days: -5)),
      eventBackgroundColor: Colors.green,
    ),
    CalendarEvent(
      eventName: "",
      eventDate: today.add(Duration(days: -6)),
      eventBackgroundColor: Colors.redAccent,
    ),

  ];
  return sampleEvents;
}
