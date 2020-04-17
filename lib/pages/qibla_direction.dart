import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:smart_moskea/qibla_files/loading_indicator.dart';
import 'package:smart_moskea/qibla_files/qibla_compass.dart';





class qibla_direction extends StatefulWidget {
  @override
  _qibla_directionState createState() => _qibla_directionState();
}

class _qibla_directionState extends State<qibla_direction> {

  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  void initState() {
    super.initState();    
  }

  

  
  


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
          child: FutureBuilder(
            future: _deviceSupport,
            builder: (_, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return LoadingIndicator();
              if (snapshot.hasError)
                return Center(
                  child: Text("Error: ${snapshot.error.toString()}"),
                );

              if (snapshot.data)
                return QiblahCompass();
              else
                return Center(child: new Text("Your Mobile Dont have Sensors to Locate Qibla Direction"));
            },
          ),
    );
  }
}