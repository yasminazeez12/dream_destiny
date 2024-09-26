import 'package:dream_destiny/gopage.dart';
import 'package:flutter/material.dart';

class Weddingdate extends StatefulWidget {
  const Weddingdate({super.key});

  @override
  State<Weddingdate> createState() => _WeddingdateState();
}

DateTime? picked;

class _WeddingdateState extends State<Weddingdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [Text('Do you have a wedding date?',
            style: TextStyle(
              fontSize: 30,
            ),
            
            ),
            SizedBox(height:30),
            Container(
              height: 50,
              width: 200,
              child: TextButton(onPressed: () {
                DatePickerDialog(firstDate: DateTime.now(), lastDate: DateTime(2025));
               
              },
                
               child: Text('Select',
              style: TextStyle(color: Colors.black,fontSize: 20,),
              ),
              style:ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(  Colors.white)
              ) ,
              
              
              ),
              

            ),
            Spacer(),
            Container(
              height: 50,
              width: 150,
              child: TextButton(onPressed: () {

            
              }, child:Text('Skip',
               style: TextStyle(color: Colors.black,fontSize: 20,),
               ),
                style:ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(  Colors.white)
              ) ,
              
               
               ),
            )
            ],
          ),
          
        ),
      ),
    );
  }
}