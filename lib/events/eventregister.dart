import 'package:dream_destiny/events/eventsgrant.dart';
import 'package:flutter/material.dart';

class Eventregister extends StatefulWidget {
  const Eventregister({super.key});

  @override
  State<Eventregister> createState() => _EventregisterState();
}

class _EventregisterState extends State<Eventregister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.pink,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text('REGISTER NOW',
              style: TextStyle(
                fontWeight:FontWeight.normal,
                fontSize: 35,
                color: Colors.white
              ),
              
              ),
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText:'Events name',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
                decoration: InputDecoration(
                  hintText:'Owner name',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white
                ),
              ),
               SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText:'Phone no',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white
                ),
              ),
               SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText:'Email',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white
                ),
              ),
               SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText:'Password',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white
                ),
              ),
              Spacer(),
              Container(
                height: 60,
                width: 160,
                child: TextButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Eventsgrant(),));
                  
                }, child: Text('REGISTER NOW',style: 
                TextStyle(
                  color: Colors.black,fontSize: 20,
                ),),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                ),
              )

          ],
        
        ),
      ),
    );

    
  }
}