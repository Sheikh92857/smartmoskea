import "package:flutter/material.dart";


class answered extends StatefulWidget {
 @override
_answeredState createState
  () => _answeredState();
}

class _answeredState extends State<answered> {
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  bool isPressed4 = false;
  bool isPressed5 = false;
  @override
  Widget build(BuildContext context) {
    return new Container(
        constraints: BoxConstraints(
        maxWidth: 1000.0
        ),
        padding: EdgeInsets.only(left: 10.0,top: 10.0),
        child:
        ListView(
                children:<Widget> [
                  ListTile(
                    leading: 
                        new CircleAvatar(
                          backgroundImage: NetworkImage("http://i.pravatar.cc/300"),
                        ),
                  title: new Text("Muhammad Abullah Answered Your Question 'What is the difference between...'"),
                  subtitle: new Text("1 hour ago"),
                  trailing: IconButton(
                    icon: Icon(Icons.thumb_up),
                    color: (isPressed1==true) ? Colors.blue : Colors.black12,
                    onPressed:(){

                      setState(() {

                        if(isPressed1)
                        {
                        isPressed1=false;
                        }

                        if(!isPressed1)
                        {
                        isPressed1=true;
                        }
                
                      });
                    }
                  ),
           
          ),
           new Divider(height: 1.0),
          ListTile(
                    leading: 
                        new CircleAvatar(
                          backgroundImage: NetworkImage("http://i.pravatar.cc/300"),
                        ),
                  title: new Text("Muhammad Abullah Answered Your Question 'What is the difference between...'"),
                  subtitle: new Text("1 hour ago"),
                  trailing: IconButton(
                    icon: Icon(Icons.thumb_up),
                    color: (isPressed2==true) ? Colors.blue : Colors.black12,
                    onPressed:(){
                   
                      setState(() {

                        if(isPressed2)
                        {
                        isPressed2=false;
                        }

                        if(!isPressed2)
                        {
                        isPressed2=true;
                        }
                
                      });
                    }
                  ),
          ),
          new Divider(height: 1.0),
          ListTile(
                    leading: 
                        new CircleAvatar(
                          backgroundImage: NetworkImage("http://i.pravatar.cc/300"),
                        ),
                  title: new Text("Muhammad Abullah Answered Your Question 'What is the difference between...'"),
                  subtitle: new Text("1 hour ago"),
                  trailing: IconButton(
                    icon: Icon(Icons.thumb_up),
                    color: (isPressed3==true) ? Colors.blue : Colors.black12,
                    onPressed:(){
                    
                      setState(() {

                        if(isPressed3)
                        {
                        isPressed3=false;
                        }

                        if(!isPressed3)
                        {
                        isPressed3=true;
                        }
                
                      });
                    }
                  ),
          ),
          new Divider(height: 1.0),
          ListTile(
                    leading: 
                        new CircleAvatar(
                          backgroundImage: NetworkImage("http://i.pravatar.cc/300"),
                        ),
                  title: new Text("Muhammad Abullah Answered Your Question 'What is the difference between...'"),
                  subtitle: new Text("1 hour ago"),
                  trailing: IconButton(
                    icon: Icon(Icons.thumb_up),
                    color: (isPressed4==true) ? Colors.blue : Colors.black12,
                    onPressed:(){
                    
                      setState(() {

                        if(isPressed4)
                        {
                        isPressed4=false;
                        }

                        if(!isPressed4)
                        {
                        isPressed4=true;
                        }
                
                      });
                    }
                  ),
          ),
          new Divider(height: 1.0),
          ListTile(
                    leading: 
                        new CircleAvatar(
                          backgroundImage: NetworkImage("http://i.pravatar.cc/300"),
                        ),
                  title: new Text("Muhammad Abullah Answered Your Question 'What is the difference between...'"),
                  subtitle: new Text("1 hour ago"),
                  trailing: IconButton(
                    icon: Icon(Icons.thumb_up),
                    color: (isPressed5==true) ? Colors.blue : Colors.black12,
                    onPressed:(){
                  
                      setState(() {

                        if(isPressed5)
                        {
                        isPressed5=false;
                        }

                        if(!isPressed5)
                        {
                        isPressed5=true;
                        }
                
                      });
                    }
                  ),
                  onTap: ()
                  {
                    print("Yes");
                  },
          ),
          new Divider(height: 1.0)
        ]
        ),
      );
  }
}