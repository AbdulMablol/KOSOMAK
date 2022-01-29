import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:raspberry_pi_stream_camera_to_flutter_live_example/widgets/CircleProgress.dart';
// import 'Homepage.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

class Temp extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Temp> with SingleTickerProviderStateMixin {
  bool isLoading = false;

  final databaseReference = FirebaseDatabase.instance.reference();

  AnimationController progressController;
  Animation<double> tempAnimation;
  Animation<double> humidityAnimation;
  Animation<double> weightAnimation;
  Animation<double> cryAnimation;
  @override
  void initState() {
    super.initState();
    databaseReference.child('DHT22').once().then((DataSnapshot snapshot) {
      double temp = snapshot.value['1-set']['Temp'];
      double humidity = snapshot.value['1-set']['Humidity'];
      double weight = snapshot.value['1-set']['Weight'];
      double cry = snapshot.value['1-set']['Cry'];
      isLoading = true;
      _dashboardInit(temp, humidity, weight, cry);
    });
  }

  _dashboardInit(double temp, double humid, double weight, double cry) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000)); //1s

    tempAnimation =
        Tween<double>(begin: 0, end: temp).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    humidityAnimation =
        Tween<double>(begin: 0, end: humid).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    weightAnimation =
        Tween<double>(begin: 0, end: weight).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    cryAnimation = Tween<double>(begin: 0, end: cry).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff5317BD),
        centerTitle: false,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Color(0xFF191919),
      body: Center(
        child: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CustomPaint(
                        foregroundPainter:
                            CircleProgress(tempAnimation.value, true),
                        child: Container(
                          width: 200,
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Temperature',
                                  style: TextStyle(
                                    color: Color(0xFFB2BCCC),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${tempAnimation.value.toInt()}',
                                  style: TextStyle(
                                      color: Color(0xFFB2BCCC),
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '°C',
                                  style: TextStyle(
                                      color: Color(0xFFB2BCCC),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      CustomPaint(
                        foregroundPainter:
                            CircleProgress(humidityAnimation.value, false),
                        child: Container(
                          width: 200,
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Humidity',
                                  style: TextStyle(
                                    color: Color(0xFFB2BCCC),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${humidityAnimation.value.toInt()}',
                                  style: TextStyle(
                                      color: Color(0xFFB2BCCC),
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '%',
                                  style: TextStyle(
                                      color: Color(0xFFB2BCCC),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 400,
                    height: 130,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                            child: Text(
                              'Weight: ${weightAnimation.value.toInt()}',
                              style: TextStyle(
                                color: Color(0xFFB2BCCC),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SfLinearGauge(
                            minimum: 0,
                            maximum: 3000,
                            showLabels: false,
                            axisTrackStyle: LinearAxisTrackStyle(
                                thickness: 40,
                                color: Colors.black,
                                edgeStyle: LinearEdgeStyle.bothCurve),
                            animateAxis: true,
                            animationDuration: 2000,
                            axisLabelStyle: TextStyle(
                              color: Color(0xFFB2BCCC),
                            ),
                            barPointers: [
                              LinearBarPointer(
                                value: weightAnimation.value,
                                color: Color(0xff5317BD),
                                thickness: 40,
                                edgeStyle: LinearEdgeStyle.bothCurve,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 400,
                    height: 130,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                            child: Text(
                              'Crying: ${cryAnimation.value.toInt()}',
                              style: TextStyle(
                                color: Color(0xFFB2BCCC),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SfLinearGauge(
                            // ranges: <LinearGaugeRange>[
                            //   LinearGaugeRange(
                            //       edgeStyle: LinearEdgeStyle.startCurve,
                            //       startValue: 1,
                            //       endValue: 33,
                            //       startWidth: 25,
                            //       endWidth: 25,
                            //       position: LinearElementPosition.outside,
                            //     color: Colors.blue,
                            //   ),
                            //   LinearGaugeRange(
                            //       startValue: 33,
                            //       endValue: 66,
                            //       startWidth: 25,
                            //       endWidth: 25,
                            //       position: LinearElementPosition.outside,
                            //       color: Color(0xffC93EC1)),
                            //   LinearGaugeRange(
                            //       edgeStyle: LinearEdgeStyle.endCurve,
                            //       startValue: 66,
                            //       endValue: 99,
                            //       startWidth: 25,
                            //       endWidth: 25,
                            //       position: LinearElementPosition.outside,
                            //       color: Colors.red),
                            // ],

                            minimum: 0,
                            maximum: 100,
                            showLabels: false,
                            axisTrackStyle: LinearAxisTrackStyle(
                                thickness: 40,
                                color: Colors.black,
                                edgeStyle: LinearEdgeStyle.bothCurve),
                            animateAxis: true,
                            animationDuration: 2000,
                            axisLabelStyle: TextStyle(
                              color: Color(0xFFB2BCCC),
                            ),
                            barPointers: [
                              LinearBarPointer(
                                shaderCallback: (bounds) => LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.deepPurple,
                                      Colors.redAccent
                                    ]).createShader(bounds),
                                value: cryAnimation.value,
                                // color: Color(0xff5317BD),
                                thickness: 40,
                                edgeStyle: LinearEdgeStyle.bothCurve,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xff5317BD)),
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
      // ),
    );
  }
}
