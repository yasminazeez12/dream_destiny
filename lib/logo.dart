import 'dart:convert';

import 'package:dream_destiny/Startingpage.dart';
import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  void initstate(){
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Startingpage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape:BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/logo.jpg')),
              ),
            ),
            SizedBox(height: 20),
            Text('Dream Destiny',
            style: TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold,
              fontStyle:FontStyle.italic
            ),),
            SizedBox(height: 60,),
            
            Text('Kerala s favourite wedding platform',
            style: TextStyle(fontSize: 14,
            color: Colors.white),)
          ],
        ),
      ),
    );
  }
}