import 'package:flutter/material.dart';

class Eventrating extends StatefulWidget {
  const Eventrating({super.key});

  @override
  State<Eventrating> createState() => _EventratingState();
}

class _EventratingState extends State<Eventrating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            
            
            height: 600,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
            
              image:DecorationImage(image: AssetImage('assets/PCG-Website-Portfolio-Page-Work-GEC.jpg'),
              fit: BoxFit.contain)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star,
                color: Colors.amber,),
                 Icon(Icons.star,
                color: Colors.amber,),
                 Icon(Icons.star,
                color: Colors.amber,),
                 Icon(Icons.star,
                color: Colors.amber,),
                 Icon(Icons.star,
                color: Colors.amber,),
                
                
                
                

              ],
             
              
              
            
            ),
          ),
        ),
      ),
    );
  }
}