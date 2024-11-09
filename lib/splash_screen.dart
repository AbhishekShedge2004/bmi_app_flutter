import 'dart:async';

import 'package:flutter/material.dart';

import 'bmi.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4 ),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return BMI();
      },));
    },);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: Text("BMI APP", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
    );

  }
}