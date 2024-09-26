import 'package:dream_destiny/events/eventregister.dart';
import 'package:dream_destiny/events/eventsgrant.dart';
import 'package:flutter/material.dart';

class Eventslogin extends StatefulWidget {
  const Eventslogin({super.key});

  @override
  State<Eventslogin> createState() => _UserloginState();
}

class _UserloginState extends State<Eventslogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor:  Colors.pink,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white
              ),
            ),
            SizedBox(height: 20),
            Container(
              height:60,
              width: 160,
              child: TextButton(onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Eventregister(),));
                
                
              }, child: Text('LOGIN',style: TextStyle(
                fontSize: 20,
                color:Colors.black,
              ),),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white)
              ),
              ),
            )
            

            
          ],
        ),
      ),
    );
  }
}

   