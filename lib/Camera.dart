import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';
import 'package:raspberry_pi_stream_camera_to_flutter_live_example/Homepage.dart';
import 'Homepage.dart';

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
  String _streamUrl;
  VlcPlayerController _vlcViewController;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _vlcViewController = new VlcPlayerController();
  }

  // ignore: unused_element
  void _incrementCounter() {
    setState(() {
      _streamUrl = 'http://192.168.1.5:8081';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF73020C),
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _streamUrl == null
                ? Container(
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Stream Closed',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                background: Paint()..color = Colors.red),
                          )
                        ]),
                      ),
                    ),
                  )
                : new VlcPlayer(
                    defaultHeight: 580,
                    defaultWidth: 750,
                    url: _streamUrl,
                    controller: _vlcViewController,
                    placeholder: Container(),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: const Icon(Icons.arrow_back),
        backgroundColor: Colors.black,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
