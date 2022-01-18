import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:raspberry_pi_stream_camera_to_flutter_live_example/Homepage.dart';
import 'package:raspberry_pi_stream_camera_to_flutter_live_example/WelcomePage.dart';
import 'Camera.dart';
import 'Temperature.dart';

import 'package:community_material_icon/community_material_icon.dart';

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
        backgroundColor: Color(0xFF35373A),
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
                    child: ElevatedButton.icon(
                      icon: Icon(CommunityMaterialIcons.video_outline,
                      size: 50,
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                      label: Text(
                        "Camera",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),

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
                            primary: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
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
                        ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Welcome()),
      );
    },
    child: const Icon(Icons.arrow_back),
    backgroundColor: Colors.black,
    ),
    );
  }
}
