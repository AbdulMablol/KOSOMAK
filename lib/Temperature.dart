import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:raspberry_pi_stream_camera_to_flutter_live_example/widgets/CircleProgress.dart';
import 'Homepage.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

class Temp extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Temp>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;

  final databaseReference = FirebaseDatabase.instance.reference();

  AnimationController progressController;
  Animation<double> tempAnimation;
  Animation<double> humidityAnimation;
  Animation<double> weightAnimation;

  @override
  void initState() {
    super.initState();

    databaseReference
        .child('DHT22')
        .once()
        .then((DataSnapshot snapshot) {
      double temp = snapshot.value['1-set']['Temp'];
      double humidity = snapshot.value['1-set']['Humidity'];
      double weight = snapshot.value['1-set']['Weight'];

      isLoading = true;
      _dashboardInit(temp, humidity, weight);
    });
  }

  _dashboardInit(double temp, double humid, double weight) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000)); //2s

    tempAnimation =
    Tween<double>(begin: -50, end: temp).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    humidityAnimation =
    Tween<double>(begin: 0, end: humid).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    weightAnimation =
    Tween<double>(begin: -2500, end: weight).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF35373A),
      body: Center(
          child: isLoading
              ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Text('Temperature',
                        style: TextStyle(color:Color(0xFFB2BCCC),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        Text(
                          '${tempAnimation.value.toInt()}',
                          style: TextStyle(color:Color(0xFFB2BCCC),
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '°C',
                          style: TextStyle(color:Color(0xFFB2BCCC),
                              fontSize: 20, fontWeight: FontWeight.bold),
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
                        Text('Humidity',
                      style: TextStyle(color:Color(0xFFB2BCCC),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                        ),
                        Text(
                          '${humidityAnimation.value.toInt()}',
                          style: TextStyle(color:Color(0xFFB2BCCC),
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '%',
                          style: TextStyle(color:Color(0xFFB2BCCC),
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              Container(
                width: 400,
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      child: Text(
                        'Weight: ${weightAnimation.value.toInt()}',
                        style: TextStyle(color:Color(0xFFB2BCCC),
                        fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ),
                         SfLinearGauge(
                          minimum: -2500,
                          maximum: 500,
                          animateAxis: true,
                          axisLabelStyle: TextStyle(
                            color: Color(0xFFB2BCCC),
                          ),
                          barPointers:
                          [LinearBarPointer(
                              value: weightAnimation.value,
                          color: Colors.deepPurple,
                            thickness: 10,
                          ),
                          ],
                          animationDuration: 2000,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          )
              : CircularProgressIndicator(
            valueColor:
            AlwaysStoppedAnimation(Colors.deepPurple),
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
      ),
    );
  }
}