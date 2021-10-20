import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:compasstools/compasstools.dart';
import 'package:flutter/services.dart';


class Compass extends StatefulWidget {

  @override
  _CompassState createState() => _CompassState();
}
class _CompassState extends State<Compass> {

  int _haveSensor;
  String sensorType;

  @override
  void initState() {
    super.initState();
    checkDeviceSensors();
  }

  Future<void> checkDeviceSensors() async {
    int _haveSensor;
    String sensorType;


    @override
    void initState() {
      super.initState();
      var checkDeviceSensors;
    }


    Future<void> checkDeviceSensors() async {
      int haveSensor;


      try {
        haveSensor = await Compasstools.checkSensors;


        switch (haveSensor) {
          case 0:
            {
              sensorType = "No sensors for compass!";
            }
            break;


          case 1:
            {
              sensorType = "Accelerometer + Magnetometer!";
            }
            break;


          case 2:
            {
              sensorType = "Gyroscope!";
            }
            break;


          default:
            {
              sensorType = "Error!";
            }
            break;
        }
      } on Exception {


      }
      if (!mounted) return;


      setState(() {
        _haveSensor = haveSensor;
      });
    }
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Compass App!'),
            ),
            body: new Container(
              child: Column(
                children: <Widget>[StreamBuilder(
                  stream: Compasstools.azimuthStream,
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                            child: new RotationTransition(
                              turns: new AlwaysStoppedAnimation(
                                  -snapshot.data / 360),
                              child: Image.asset("assets/compass.png"),
                            )
                        ),
                      );
                    }
                    else
                      return Text("Error in stream!");
                  },
                ),
                  Text("SensorType " + sensorType),
                ],
              ),
            ),
          )
      );
    }

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Compass App!'),
          ),
          body: new Container(
            child: Column(
              children: <Widget>[StreamBuilder(
                stream: Compasstools.azimuthStream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                          child: new RotationTransition(
                            turns: new AlwaysStoppedAnimation(
                                -snapshot.data / 360),
                            child: Image.asset("assets/compass.png"),
                          )
                      ),
                    );
                  }
                  else
                    return Text("Error in stream!");
                },
              ),
                Text("SensorType " + sensorType),
              ],
            ),
          ),
        )
    );
  }
}
/*

class _CompassState extends StatelessWidget {
  double _direction;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
        debugShowCheckedModeBanner: false ,
      home: CompassRed(direction: _direction,),

    );
  }
}

class CompassRed extends StatelessWidget {
  const CompassRed({ Key key ,@required double direction }) : _direction = direction,
        super(key:  key );
  final double  _direction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Compress'),),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Transform.rotate(angle: ((_direction??0) * (pi / 180) * -1),
        child: Image.asset('assets/compass.png'),
        ),
      ),

    );
  }
}

*/