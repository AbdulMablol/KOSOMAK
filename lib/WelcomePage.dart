import 'package:flutter/material.dart';
import 'package:raspberry_pi_stream_camera_to_flutter_live_example/model/slide.dart';
import 'package:raspberry_pi_stream_camera_to_flutter_live_example/widgets/slide_dots.dart';
import 'package:raspberry_pi_stream_camera_to_flutter_live_example/widgets/slide_item.dart';
import 'Homepage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Welcome()));
}

class Welcome extends StatefulWidget {
  const Welcome({key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int _currentPage = 0;
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff191919),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView.builder(
              onPageChanged: _onPageChanged,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: slideList.length,
              itemBuilder: (ctx, i) => SlideItem(i)),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 200),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < slideList.length; i++)
                      if (i == _currentPage)
                        SlideDots(true)
                      else
                        SlideDots(false)
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 35, right: 35),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff5317BD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
