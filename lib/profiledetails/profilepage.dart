
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_destiny/profiledetails/profilebody.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {

  bool getUpdatesOwnwhatsapp=false;
  String selectedGender ="female";
  final _firestore=FirebaseFirestore.instance;
  final FirebaseAuth_auth = FirebaseAuth.instance;
  final TextEditingController _emailcontroller=TextEditingController();
    






  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
        
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed:  () {
            
            
          }, icon:Icon(Icons.arrow_back),
          color: Colors.black,),
          title: Text('profile',
          style: TextStyle(
            color: Colors.black
          ),),
          centerTitle: true,
          
        ),
        body: Profilebody(),
      ),
    );
  }
}