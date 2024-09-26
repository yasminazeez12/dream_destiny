import 'package:dream_destiny/homepage.dart';
import 'package:dream_destiny/logo.dart';
import 'package:dream_destiny/mybottomnavbar.dart';
import 'package:dream_destiny/vendors.dart';
import 'package:flutter/material.dart';

class People extends StatefulWidget {
  const People({super.key});

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text('How many people will be there for the wedding?'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          
          SizedBox(height: 30),
          Text('50 people',
          style: TextStyle(color: Colors.pink),),
          Text('A BIG CROWD!',
          style: TextStyle(
            color:Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          Container(
            height: 1,
            width: 200,
            color: Colors.pink,
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Text('0'),
              Text('500'),
            ],
          ),
          Container(
            height: 50,
            width: 150,
            child: TextButton(onPressed: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Mybottomnavbar(),));
              
              
            }, child:Text('Continue',
            style: TextStyle(
              color: Colors.white
            ),
            ),
            style: ButtonStyle(
              backgroundColor:WidgetStatePropertyAll(Colors.pink)
            ),
            ),
          )



        ],
      ),
    );
  }
}