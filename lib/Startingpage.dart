import 'package:dream_destiny/login_Signp/login.dart';
import 'package:dream_destiny/login_Signp/register.dart';
import 'package:flutter/material.dart';

class Startingpage extends StatefulWidget {
  const Startingpage({super.key});

  @override
  State<Startingpage> createState() => _StartingpageState();
}

class _StartingpageState extends State<Startingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/144227900da9372008edb7b395dcaba8.jpg'),
                fit: BoxFit.cover)
              ),
            ),
          ),
          Text('We organize',
          style: TextStyle(fontSize: 30),),
          Text('Your Dream Day',
          style: TextStyle(fontSize: 30),),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 170,
              child: TextButton(onPressed:  () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(),));
                
              }, child:Text('REGISTER NOW',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
              
              
              ),
              style: ButtonStyle(
                backgroundColor:WidgetStatePropertyAll(const Color.fromARGB(255, 170, 13, 65))
              ),
              
              ),
            ),
          )
          


        ],
      ),

    );
  }
}