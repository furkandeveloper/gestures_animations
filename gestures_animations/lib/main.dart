import 'package:flutter/material.dart';
import 'package:gestures_animations/screens/homePageScreen.dart';

void main(){
  runApp(HomePage());
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageScreen(),
    );
  }

}