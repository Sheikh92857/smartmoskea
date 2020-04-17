// import 'dart:async';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart';
// // import 'package:flutter_speed_dial/flutter_speed_dial.dart';



// class map extends StatefulWidget {
//   @override
//   _mapState createState() => _mapState();
// }

// class _mapState extends State<map> {

//   BitmapDescriptor myCurrentPositionIcons;
//   Set<Marker> _markers = {};
//   GoogleMapController _controller;
//   Position _position;
//   Widget _child;

//   void initState()
//   {
//     getLocation();
//     super.initState();
//     setIconToMyCurrentLocation();
//   }

//   void setIconToMyCurrentLocation() async
//   {
//     myCurrentPositionIcons  = await BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(devicePixelRatio: 2.5),
//       'assets/marker.png');
//   }

//   void getLocation() async
//   {
//     Position res= await Geolocator().getCurrentPosition();
//     setState(() {
//       _position=res;
//       _child=mapWidget();
//     });
//   }


  

 
//   // void _showModalBottomSheet(context)
//   // {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     builder: (builder)
//   //     {
//   //       return new Container(
//   //         height: 300,
//   //         decoration: BoxDecoration(
//   //           color: Colors.white,
//   //           borderRadius:BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
//   //         ),
//   //         child: Column(
//   //           children: <Widget>[
//   //             new Container(
//   //               color: Colors.deepOrangeAccent,
//   //               child: new Row(
//   //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //                 children: <Widget>[
//   //                   Column(
                      
//   //                     children: <Widget>[
                        
//   //                       Padding(
//   //                         padding: const EdgeInsets.all(8.0),
//   //                         child: new Text("Haji Camp Mosque",
//   //                         style: TextStyle(fontSize:20,color:Colors.white)
//   //                         ),
//   //                       ),
//   //                       Padding(
//   //                         padding: const EdgeInsets.all(8.0),
//   //                         child: Row(
//   //                           children: <Widget>[
//   //                             new Text("Rawalpindi, Pakistan",
//   //                             style: TextStyle(fontSize:14,color: Colors.white70)
//   //                             ),
//   //                             new Text("  25 min",
//   //                             style: TextStyle(fontSize:14,color: Colors.white70)
//   //                             ),
//   //                           ],
//   //                         ),
//   //                       ),
//   //                     ],
//   //                   ),
//   //                   new Column(
//   //                     crossAxisAlignment: CrossAxisAlignment.end,
//   //                     children: <Widget>[
//   //                       new Container(
//   //                         height: 50,
//   //                         width: 50,
//   //                         decoration: BoxDecoration(
//   //                           color: Colors.white,
//   //                           borderRadius: BorderRadius.all(Radius.circular(50))
                            
//   //                         ),
//   //                         child: Icon(Icons.directions_car,size:35,color: Colors.deepOrangeAccent,),
//   //                       )
//   //                     ],
//   //                   )
//   //                 ],
//   //               ),
                
//   //             ),
//   //             new Column(
//   //               children: <Widget>[
//   //                 DataTable(
//   //                   columns: [
//   //                     DataColumn(label: Text("Icon")),
//   //                     DataColumn(label: Text("Prayer")),
//   //                     DataColumn(label: Text("Timing")),
//   //                   ],
//   //                   rows: [
//   //                     DataRow(
//   //                       cells: [
//   //                         DataCell(
//   //                           new Icon(Icons.access_time)
//   //                         ),
//   //                         DataCell(
//   //                           new Text("Fajjar")
//   //                         ),
//   //                         DataCell(
//   //                           new Text("5:00AM")
//   //                         ),
//   //                       ]
//   //                     ),
//   //                     DataRow(
//   //                       cells: [
//   //                         DataCell(
//   //                           new Icon(Icons.access_time)
//   //                         ),
//   //                         DataCell(
//   //                           new Text("Zuhar")
//   //                         ),
//   //                         DataCell(
//   //                           new Text("1:00PM")
//   //                         ),
//   //                       ]
//   //                     ),
                   
//   //                   DataRow(
//   //                       cells: [
//   //                         DataCell(
//   //                           new Icon(Icons.access_time)
//   //                         ),
//   //                         DataCell(
//   //                           new Text("Asaar")
//   //                         ),
//   //                         DataCell(
//   //                           new Text("3:45PM")
//   //                         ),
//   //                       ]
//   //                     ),
//   //                   ]
//   //                 )
//   //               ],
//   //             )
//   //           ],
//   //         ),
//   //       );
//   //     }
//   //   );
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _child,
//     );
//   }



// Widget mapWidget()
// {
  
//   return Center(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: GoogleMap(
//             markers: _markers,
//             initialCameraPosition: CameraPosition(
//               target: LatLng(_position.latitude,_position.longitude),
//               zoom: 18.0
//               ),
//               onMapCreated: (GoogleMapController controller)
//               {
//                 _controller=controller;
//                 setState((){
//                   _markers.add(
//                     Marker(
//                     markerId: MarkerId("myMarker"),
//                     position: LatLng(_position.latitude,_position.longitude),
//                     icon: myCurrentPositionIcons,
//                   )
//                   );
//                 });
//               },
              
              
//             ),
//           ),
//       );
// }
// }

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smart_moskea/states/app_state.dart';

class map extends StatelessWidget {
  map({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChangeNotifierProvider<AppState>(
      create: (context) =>AppState(),
      child: Map()));
  }
}

class Map extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return SafeArea(
      child: appState.initialPosition == null
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
              SpinKitRotatingCircle(
              color: Colors.black,
                size: 50.0,
              )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Visibility(
                    visible: appState.locationServiceActive == false,
                    child: Text("Please enable location services!", style: TextStyle(color: Colors.grey, fontSize: 18),),
                  )
                ],
              )
            )
          : Stack(
              children: <Widget>[
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: appState.initialPosition, zoom: 17.0),
                  onMapCreated: appState.onCreated,
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  compassEnabled: true,
                  markers: appState.markers,
                  onCameraMove: appState.onCameraMove,
                  polylines: appState.polyLines,
                ),

                Positioned(
                  top: 10.0,
                  right: 60.0,
                  left: 5.0,
                  child: Container(
                    height: 40.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 5.0),
                            blurRadius: 10,
                            spreadRadius: 3)
                      ],
                    ),
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: appState.destinationController,
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        appState.sendRequest(value);
                      },
                      decoration: InputDecoration(
                        icon: Container(
                          margin: EdgeInsets.only(left: 20, top: 0),
                          width: 5,
                          height: 15,
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Find Mosque",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15.0, top: 0.0),
                      ),
                    ),
                  ),
                ),

//        Positioned(
//          top: 40,
//          right: 10,
//          child: FloatingActionButton(onPressed: _onAddMarkerPressed,
//          tooltip: "aadd marker",
//          backgroundColor: black,
//          child: Icon(Icons.add_location, color: white,),
//          ),
//        )
              ],
            ),
    );
  }
}
