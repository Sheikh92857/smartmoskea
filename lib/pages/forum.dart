import 'package:flutter/material.dart';
import 'package:smart_moskea/pages/answered.dart';
import 'package:smart_moskea/pages/like_questions.dart';
import 'package:smart_moskea/pages/your_questions.dart';
import 'package:smart_moskea/pages/messages.dart';



class forum extends StatefulWidget {
  @override
  _forumState createState() => _forumState();
}

class _forumState extends State<forum> {

  int selectPage = 0;
  final List<String> category = ["Messages", "Answered", "Your Questions", "Likes"];


Widget callPage(int index)
{
  switch(index)
  {
    case 0: return messages();
    case 1: return answered();
    case 2: return your_questions();
    case 3: return like_questions();
  }
}
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
      height: 90.0,
        color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (BuildContext context, int index)
        {
          return GestureDetector(
            onTap:()
            {
              setState(() {
                selectPage=index;
              });
            },
          child:  new Padding(
          padding: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 20.0,
        ),
        child: new Text(category[index],
        style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: index==selectPage ? Colors.white : Colors.white70,
        letterSpacing: 1.2,
        ),),
        ),
          );
        },
      ),
    ),
        Expanded(
          child: new Container(
              decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
          ),
        ),
            child: callPage(selectPage),
              )
              )
              ]);
  }
}



