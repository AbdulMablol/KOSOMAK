import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:raspberry_pi_stream_camera_to_flutter_live_example/Homepage.dart';
import 'package:raspberry_pi_stream_camera_to_flutter_live_example/WelcomePage.dart';
import 'Camera.dart';
import 'Temperature.dart';

import 'package:community_material_icon/community_material_icon.dart';


class Home extends StatefulWidget {
  const Home({key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF191919),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff5317BD),
          centerTitle: false,
            title: const Text('Home',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
        ),
        body: Container(
          margin: EdgeInsets.only(bottom: 75),
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Stack(
          children: <Widget>[
            Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 160),
            child: Column(
                children: <Widget>[
                Image.asset(('assets/images/baby-last.png'),
              ),

            Padding(
              padding: const EdgeInsets.only(top: 122),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //column 1
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                             color: Color(0xff5317bd),
                              shape: BoxShape.circle,
                          ),
                          child: Icon(CommunityMaterialIcons.video_outline,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                        },
                      ),
                        ),
                    ],
                  ),

                  //column 2
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff5317BD),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.add_location,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Temp()),
                          );
                          },
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
        ]),
          ),
    ),
    ],
          ),
    ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => Welcome()),
      //     );
      //   },
      //   child: const Icon(Icons.arrow_back),
      //   backgroundColor: Colors.black,
      // ),
    );
  }
}
