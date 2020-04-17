import "package:flutter/material.dart";


class your_questions extends StatefulWidget {

 @override
_your_questionsState createState
  () => _your_questionsState();
}

class _your_questionsState extends State<your_questions> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(   floatingActionButton:FloatingActionButton(
       backgroundColor: Colors.deepOrangeAccent,
        child: Icon(Icons.add),
        onPressed: ()
        {

        },),

            body: new Container(
        constraints: BoxConstraints(
        maxWidth: 1000.0
        ),
        padding: EdgeInsets.only(left: 10.0,top: 10.0),
        child:
            new ListView(
              children: <Widget>[
                new ListTile(
                  
                  title: new RichText(
                    text: new TextSpan(
                      style:new TextStyle(
                         color: Colors.black,
                         fontSize: 14.0,
                      ),
                      children: <TextSpan>[
                        new TextSpan(text:"You asked ", style: new TextStyle(fontWeight: FontWeight.bold,)),
                        new TextSpan(text: "'What is the difference sunnah and faraiz deeds'")
                      ]
                    ),
                  ),
                  subtitle: new Text("2 minutes ago"),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete_outline,   
                    ),
                    onPressed: ()
                    {
                      
                    },
                  )
                ),
                new Divider(),
                new ListTile(
                  
                  title: new RichText(
                    text: new TextSpan(
                      style:new TextStyle(
                         color: Colors.black,
                         fontSize: 14.0,
                      ),
                      children: <TextSpan>[
                        new TextSpan(text:"You asked ", style: new TextStyle(fontWeight: FontWeight.bold,)),
                        new TextSpan(text: "'What is the meaning of shirq'")
                      ]
                    ),
                  ),
                  subtitle: new Text("2 minutes ago"),
                   trailing: IconButton(
                    icon: Icon(
                      Icons.delete_outline,   
                    ),
                    onPressed: ()
                    {
                      
                    },
                  )
                ),
                new Divider(),
                new ListTile(
                 
                  title: new RichText(
                    text: new TextSpan(
                      style:new TextStyle(
                         color: Colors.black,
                         fontSize: 14.0,
                      ),
                      children: <TextSpan>[
                        new TextSpan(text:"You asked ", style: new TextStyle(fontWeight: FontWeight.bold,)),
                        new TextSpan(text: "'Is it good to sleep after fajar prayer'")
                      ]
                    ),
                  ),
                  subtitle: new Text("2 hours ago"),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete_outline,   
                    ),
                    onPressed: ()
                    {

                    },
                  ),
                ),
                new Divider(),
                new ListTile(
                 
                  title: new RichText(
                    text: new TextSpan(
                      style:new TextStyle(
                         color: Colors.black,
                         fontSize: 14.0,
                      ),
                      children: <TextSpan>[
                        new TextSpan(text:"You asked ", style: new TextStyle(fontWeight: FontWeight.bold,)),
                        new TextSpan(text: "'how to jugde a double face person'")
                      ]
                    ),
                  ),
                  subtitle: new Text("2 minutes ago"),
                   trailing: IconButton(
                    icon: Icon(
                      Icons.delete_outline,   
                    ),
                    onPressed: ()
                    {
                      
                    },
                  )
                ),
                new Divider(),
                new ListTile(
                  title: new RichText(
                    text: new TextSpan(
                      style:new TextStyle(
                         color: Colors.black,
                         fontSize: 14.0,
                      ),
                      children: <TextSpan>[
                        new TextSpan(text:"You asked ", style: new TextStyle(fontWeight: FontWeight.bold,)),
                        new TextSpan(text: "'What is the difference between those who fast and one who dont'")
                      ]
                    ),
                  ),
                  subtitle: new Text("2 month ago"),
                   trailing: IconButton(
                    icon: Icon(
                      Icons.delete_outline,   
                    ),
                    onPressed: ()
                    {
                      
                    },
                  )
                ),
                new Divider(),
                new ListTile(
                  
                  title: new RichText(
                    text: new TextSpan(
                      style:new TextStyle(
                         color: Colors.black,
                         fontSize: 14.0,
                      ),
                      children: <TextSpan>[
                        new TextSpan(text:"You asked ", style: new TextStyle(fontWeight: FontWeight.bold,)),
                        new TextSpan(text: "'Which islamic name is best for a boy'")
                      ]
                    ),
                  ),
                  subtitle: new Text("2 minutes ago"),
                   trailing: IconButton(
                    icon: Icon(
                      Icons.delete_outline,   
                    ),
                    onPressed: ()
                    {
                      
                    },
                  )
                ),
                new Divider(),
                
              ],
            )
    ),
     );
  }
  }
