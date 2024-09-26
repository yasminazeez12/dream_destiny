import 'package:flutter/material.dart';

class Keralavenues extends StatefulWidget {
  const Keralavenues({super.key});

  @override
  State<Keralavenues> createState() => _KeralavenuesState();
}

class _KeralavenuesState extends State<Keralavenues> {
  @override
 
   
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('venues.Kerala',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          IconButton(onPressed: () {
            
          }, icon:Icon(Icons.share)),
          SizedBox(width: 5),
          IconButton(onPressed: () {
            
          }, icon:Icon(Icons.save))
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/2e9a72fb638260bdf8579a4f4c913d89.jpg'),
                  fit: BoxFit.cover)
                ),
                
              ),
              
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('Alappuzha',style: TextStyle(fontSize: 15),),
                ),
                Spacer(),
                Icon(Icons.star,color: Colors.pink,),
                Text('4.3'),
               
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Text('Heritage village',style: TextStyle(fontSize:25,color: Colors.black),),
                 
                ],
              
              ),
              
              
            ),
            Row(
              children: [
                 Text('Rs 2000',
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('per plate'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  
                }, child: Text('ADD'))
              
              ],
            )
            
            
          



            
            
          ],
        ),
      )
      
    );
  }
}