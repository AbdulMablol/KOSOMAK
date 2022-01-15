import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:raspberry_pi_stream_camera_to_flutter_live_example/Homepage.dart';

import 'Camera.dart';
import 'Temperature.dart';

// void main() =>
//     runApp(MaterialApp(
//         debugShowCheckedModeBanner: false, home: Home()));

class Home extends StatefulWidget {
  const Home({key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //column 1
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 180,
                    height: 80,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        child: Text(
                          "Camera",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ],
              ),

              //column 2
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 180,
                    height: 80,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Temp()),
                          );
                        },
                        child: Text(
                          "Temperature/Humidity",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
