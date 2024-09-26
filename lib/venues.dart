import 'package:flutter/material.dart';

class Venues extends StatefulWidget {
  const Venues({super.key});

  @override
  State<Venues> createState() => _VenuesState();
}

class _VenuesState extends State<Venues> {
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
            SizedBox(height:40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.pink
                      
                    ),
                    borderRadius: BorderRadius.circular(30)

                  ),
                  child:IconButton(onPressed: () {
                    
                  }, icon:Row(
                    children: [
                      Icon(Icons.message,
                      color: Colors.pinkAccent,
                      
                      
                      ),
                      SizedBox(width: 20,),
                      Text('Message',style: TextStyle(
                        color:Colors.pinkAccent
                      ),),
                      
                    ],
                  ),
                  
                
                  
                  
                  
                  ),
                ),
                SizedBox(width: 30,),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green
                    ),
                    
                  ),
                  
                  
                  child: IconButton(onPressed: () {
                    
                  }, icon:Icon(Icons.call,
                  color: Colors.green,)),
                )
               
              
              ],
            )
            
            
          



            
            
          ],
        ),
      )
      
       
    );
  }
}