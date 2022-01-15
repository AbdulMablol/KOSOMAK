import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';


class Temp extends StatefulWidget {
final Future<FirebaseApp> _fbApp= Firebase.initializeApp();
  @override
  _TempState createState() => _TempState();
}

class _TempState extends State<Temp> {
  String displayText = 'kosomak';
  final _database = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _activateListeners();
  }
  void _activateListeners() {
    _database.child('DHT22/1-set/Temp').onValue.listen((event) {

      final String Temp = event.snapshot.value;
      setState(() {
        displayText = 'Temperature is: $Temp';
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(displayText),
    );
  }
}
