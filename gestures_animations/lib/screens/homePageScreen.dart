import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageScreenState();
}

class HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  int tabsCount = 0;
  int doubleTabsCount = 0;
  int longPressCount = 0;
  double xPosition = 0.0;
  double yPosition = 0.0;
  double boxSize = 0.0;
  double fullBoxSize = 150.0;

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 10000),
        // gereksiz kaynakları kullanımını kapatır.
        // ancak kullanabilmek için SingleTickerProviderStateMixin with etmemiz gerekir
        // with edilen bir class inherit edilmiş gibi davranacaktır
        vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
        animation.addListener((){
          setState(() {
           boxSize=fullBoxSize*animation.value; 
          });
          centerBox(context);
        });
        // çalış
        animationController.forward();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (xPosition==0.0) {
    //   centerBox(context);
    // }
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
                width: boxSize,
                height: boxSize,
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

  void centerBox(BuildContext context) {
    // ekranın tam ortası
    //Media query o context ile alakalı sorgulama yapabilir
    xPosition = (MediaQuery.of(context).size.width / 2.0) - (boxSize / 2.0);
    yPosition =
        (MediaQuery.of(context).size.height / 2.0) - (boxSize / 2.0 - 30.0);
    setState(() {
      this.xPosition = xPosition;
      this.yPosition = yPosition;
    });
  }
}
