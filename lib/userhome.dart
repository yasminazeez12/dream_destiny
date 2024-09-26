import 'package:dream_destiny/databasemethods.dart';
import 'package:flutter/material.dart';

class Userhome extends StatefulWidget {
  const Userhome({super.key});

  @override
  State<Userhome> createState() => _UserhomeState();
}

class _UserhomeState extends State<Userhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: Databasemethods().getInstitutionsStream(), builder:(context, snapshot) {
        return Container(
          height: 130,
          width: 200,
          color: Colors.amber,
        );
        
      },),
      
    );
  }
}