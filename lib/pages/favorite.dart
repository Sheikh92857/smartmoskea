import 'package:flutter/material.dart';

class favorite extends StatefulWidget {
  @override
  _favoriteState createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: new Container(
              decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
        child: new ListView(
            children: <Widget>[
              new ListTile(
                leading: Icon(Icons.announcement,color:Colors.deepOrangeAccent,),
                title: new RichText(
                  text: new TextSpan(
                    style:new TextStyle(
                       color: Colors.black,
                       fontSize: 14.0,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text:"Hajji Camp  (Golra Mor) \n", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)),
                      new TextSpan(text:"Death Announcement: \n", style: new TextStyle(fontWeight: FontWeight.bold,)),
                      new TextSpan(text: "Muhammad idrees has passed away, kindly pray for his forgiveness and funeral will be 10'O'Clock")
                    ]
                  ),
                ),
                subtitle: new Text("2 minutes ago"),
              ),
              new Divider(),
              new ListTile(
                leading: Icon(Icons.announcement,color:Colors.deepOrangeAccent),
                title: new RichText(
                  text: new TextSpan(
                    style:new TextStyle(
                       color: Colors.black,
                       fontSize: 14.0,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text:"Bilal Masjid  (Golra Mor) \n", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)),
                      new TextSpan(text:"Death Announcement: \n", style: new TextStyle(fontWeight: FontWeight.bold,)),
                      new TextSpan(text: "Raja Zeeshan has passed away, kindly pray for his forgiveness and funeral will be 10'O'Clock")
                    ]
                  ),
                ),
                subtitle: new Text("5 days ago"),
              ),
              new Divider(),  
              new ListTile(
                leading: Icon(Icons.announcement,color:Colors.deepOrangeAccent),
                title: new RichText(
                  text: new TextSpan(
                    style:new TextStyle(
                       color: Colors.black,
                       fontSize: 14.0,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text:"Akbari Masjid  (Mohanpura) \n", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)),
                      new TextSpan(text:"Khatm-E-Quranpak Announcement: \n", style: new TextStyle(fontWeight: FontWeight.bold,)),
                      new TextSpan(text: "At 11AM, there will be a khatam at Akbari Masjid Mohanpura")
                    ]
                  ),
                ),
                subtitle: new Text("1 Month ago"),
              ),
              new Divider(),
              new ListTile(
                leading: Icon(Icons.announcement,color:Colors.deepOrangeAccent),
                title: new RichText(
                  text: new TextSpan(
                    style:new TextStyle(
                       color: Colors.black,
                       fontSize: 14.0,
                    ),
                    children: <TextSpan>[
                      new TextSpan(text:"Kubra Masjid  (Mohanpura) \n", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)),
                      new TextSpan(text:"Khatm-E-Quranpak Announcement: \n", style: new TextStyle(fontWeight: FontWeight.bold,)),
                      new TextSpan(text: "At 1PM, there will be a khatam at Akbari Masjid Mohanpura")
                    ]
                  ),
                ),
                subtitle: new Text("2 Months ago"),
              ),
              new Divider(),
              
            ]                
        )            
    )
    )
    ]);
}
}