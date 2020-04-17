import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widget = (Platform.isAndroid)
        ? CircularProgressIndicator(
          valueColor:new AlwaysStoppedAnimation(Colors.deepOrangeAccent),
        )
        : CupertinoActivityIndicator();
    return Container(
      alignment: Alignment.center,
      child: widget,
    );
  }
}