import "package:flutter/material.dart";


class notification extends StatefulWidget {
 @override
_notificationState createState
  () => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back
          ),
          onPressed: ()
          {
            Navigator.of(context).pop();
          },
        ),
        title: new Text("Notifications"),
      ),
      body: new Container(
        padding: EdgeInsets.only(top: 10.0,left: 10.0),
        child: new ListView(
          children: <Widget>[
            new ListTile(
              leading: Icon(
                Icons.notifications
              ),
              title: new Text("Your Mobile is automatically set to Silent Mode"),
              subtitle: new Text("1 minute ago"),
            ),
            new Divider(),
            new ListTile(
              leading: Icon(
                Icons.notifications
              ),
              title: new Text("Your Mobile is automatically set to Silent Mode"),
              subtitle: new Text("1 minute ago"),
            ),
            new Divider(),
            new ListTile(
              leading: Icon(
                Icons.notifications
              ),
              title: new Text("Your Mobile is automatically set to Silent Mode"),
              subtitle: new Text("1 minute ago"),
            ),
            new Divider(),
            new ListTile(
              leading: Icon(
                Icons.notifications
              ),
              title: new Text("Your Mobile is automatically set to Silent Mode"),
              subtitle: new Text("1 minute ago"),
            ),
            new Divider(),
            new ListTile(
              leading: Icon(
                Icons.notifications
              ),
              title: new Text("Your Mobile is automatically set to Silent Mode"),
              subtitle: new Text("1 minute ago"),
            ),
            new Divider(),
            
          ],
        ),
      )
    );
  }
}