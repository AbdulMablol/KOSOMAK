import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
// import 'package:flutter_vlc_player/vlc_player_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dashboard_icons.dart';
// import 'package:raspberry_pi_stream_camera_to_flutter_live_example/Homepage.dart';
// import 'Homepage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raspberry Pi camera',
      home: MyHomePage(title: 'Live Stream'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String _streamUrl;
  VlcPlayerController _vlcViewController;
  Future<void> intializePlayer() async {}
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _vlcViewController = VlcPlayerController.network(
      'https://streamable.com/l/dymet3/mp4.mp4',
      hwAcc: HwAcc.FULL,
      options: VlcPlayerOptions(),
    );
  }

  void dispose() async {
    super.dispose();
    await _vlcViewController.stopRendererScanning();
    await _vlcViewController.dispose();
  }

  // void _incrementCounter() {
  //   setState(() {
  //     _streamUrl = 'https://media.w3.org/2010/05/sintel/trailer.mp4';
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff5317BD),
        centerTitle: false,
        title: const Text(
          'Livestream',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Color(0xFF191919),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _vlcViewController == null
                ? Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff5317bd),
                        width: 5,
                      ),
                    ),
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Stream Closed',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              // background: Paint()..color = Color(0xff5317BD)
                            ),
                          )
                        ]),
                      ),
                    ),
                  )
                : new VlcPlayer(
                    // defaultHeight: 480,
                    // defaultWidth: 640,
                    // url: _streamUrl,
                    aspectRatio: 16 / 9,
                    controller: _vlcViewController,
                    placeholder: Container(),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                  icon: Icon(
                    Laser.target_laser,
                    size: 40,
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff5317bd),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {},
                  label: Text(
                    'ON',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 150,
                ),
                Container(
                  width: 100,
                  height: 45,
                  decoration: ShapeDecoration(
                      color: Color(0xff5317BD),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  // margin: EdgeInsets.fromLTRB(60, 50, 60, 10),
                  // padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      '37.5°C',
                      style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontFamily: 'Consolas'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => Home()),
      //     );
      //   },
      //   child: const Icon(Icons.arrow_back),
      //   backgroundColor: Colors.black,
      // ), // This trailing comma makes auto-formatting nicer for build methods.

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.play_arrow),
      // ),
    );
  }
}
