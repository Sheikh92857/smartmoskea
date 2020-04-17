import 'qibla_direction.dart';
import 'map.dart';
import 'package:smart_moskea/pages/notification.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_moskea/ui/login_page.dart';



class BeforeLoggedInMainScreen extends StatefulWidget {
  BeforeLoggedInMainScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _BeforeLoggedInMainScreenState createState() => _BeforeLoggedInMainScreenState();
}

class _BeforeLoggedInMainScreenState extends State<BeforeLoggedInMainScreen> {
  int _counter = 0;
  int _current=1;

  Widget callPage(int index)
  {
    switch(index)
    {
      case 0: return qibla_direction();
      case 1: return Theme(data: Theme.of(context).copyWith(canvasColor: Colors.transparent), child:map());
      case 2: return LoginPage();
    //  case 4: return user_profile();
    }
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: new AppBar(
        backgroundColor: Colors.deepOrangeAccent,
      //  leading: new Icon(Icons.menu),
       title: new Text(
         "Smart Moskea",
         style: TextStyle(
           fontSize: 28.0,
            fontWeight: FontWeight.bold,

         ),
       ),
       elevation: 0.0,
       actions: <Widget>[
         IconButton(
           icon: Icon(
             Icons.notifications,
             color: Colors.white,
           ),
           onPressed: () {
             Navigator.of(context).push(
               MaterialPageRoute(builder: (context)=>notification())
             );
           },
         ),
           ],
         ),
      drawer: new Drawer(

        child: new ListView(
          children: <Widget>[
             new UserAccountsDrawerHeader(
              accountName: new Text("Ahmad Hassan"),
              accountEmail: new Text("ahmadhassan136@gmail.com"),
            
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new NetworkImage("http://i.pravatar.cc/300"),
            ),),
            new ListTile(
              trailing: new Icon(Icons.settings),
              title: new Text("Settings"),
            ),
            new Divider(),
            new ListTile(
              trailing: new Icon(Icons.exit_to_app),
              title: new Text("Logout"),
            ),

          ],
        ),
      ),
      body: callPage(_current),
      // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        backgroundColor: Colors.white,
        color: Colors.deepOrangeAccent,
          items: <Widget>[
            Icon(Icons.directions,size: 30,color: Colors.black),
            Icon(Icons.add,size: 30,color: Colors.black),
            Icon(Icons.person,size: 30,color: Colors.black),
          ],
        index: 1,
        onTap: (index){
          setState(() {
            _current=index;
          });
        },
      ),
    );
  }
}