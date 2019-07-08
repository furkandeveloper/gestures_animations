import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageScreenState();
}

class HomePageScreenState extends State {
  int tabsCount = 0;
  int doubleTabsCount = 0;
  int longPressCount = 0;
  double xPosition = 40.0;
  double yPosition = 60.0;
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
      body: GestureDetector(
        // tek tıklama eventi
        // stateful wigdet olduğu için set state fonksiyonu çalışabilir
        onTap: () {
          setState(() {
            tabsCount++;
          });
        },
        onDoubleTap: () {
          setState(() {
            doubleTabsCount++;
          });
        },
        onLongPress: () {
          setState(() {
            longPressCount++;
          });
        },
        // dikey ekranda sürükle
        onVerticalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            yPosition += value.delta.dy;
          });
        },
        onHorizontalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            xPosition += value.delta.dx;
          });
        },
        child: // ekranın istediğiniz yerine bir eleman koymaya yarar
            Stack(
          children: <Widget>[
            Positioned(
              left: xPosition,
              top: yPosition,
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(color: Colors.brown),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Material(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
              "Tab :$tabsCount, Double Tab :$doubleTabsCount, Long Press : $longPressCount"),
        ),
      ),
    );
  }
}
