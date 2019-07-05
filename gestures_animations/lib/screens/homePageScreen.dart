import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageScreenState();
}

class HomePageScreenState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottom overflowed hatası için çözüm;
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          "Gestures And Animations",
          textDirection: TextDirection.ltr,
        ),
        backgroundColor: Colors.black87,
      ),
      // ekranın istediğiniz yerine bir eleman koymaya yarar
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 40.0,
            top: 60.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(color: Colors.brown),
            ),
          )
        ],
      ),
    );
  }
}
