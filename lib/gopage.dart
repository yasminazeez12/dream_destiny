import 'package:dream_destiny/categories.dart';
import 'package:flutter/material.dart';

class Gopage extends StatefulWidget {
  const Gopage({super.key});

  @override
  State<Gopage> createState() => _GopageState();
}

class _GopageState extends State<Gopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/102991-destination-weddings-in-india-lead.jpeg'),
          fit: BoxFit.cover
          )
          
        ),
        
    
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Text('Your Wedding Adventure Starts Here',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 10),
              Container(
                height: 40,
                width: 90,
                child: TextButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Categories(),));
                  
                }, child:Text('GO',style: 
                TextStyle(
                  color: Colors.white
                ),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.pink)
                ),
          
                ),
                
              )
          
            ],
          ),
        ),

      ),
    );
  }
}