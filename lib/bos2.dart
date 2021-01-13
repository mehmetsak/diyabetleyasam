
/*
import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
        eventDate: today.add(Duration(days: -1)),
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
 */

/*
if(renk=="1"){
  CalendarEvent(
    eventName: "",
    eventDate: today.add(Duration()),
    eventBackgroundColor: Colors.green,
  ),

}
else if (renk=="2"){
      CalendarEvent(
        eventName: "",
        eventDate: today.add(Duration()),
        eventBackgroundColor: Colors.orange,
      ),
    }
else{ CalendarEvent(
    eventName: "",
    eventDate: today.add(Duration()),
    eventBackgroundColor: Colors.red,
  ),}

 */
