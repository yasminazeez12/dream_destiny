import 'package:dream_destiny/events/message.dart';
import 'package:dream_destiny/inbox.dart';
import 'package:flutter/material.dart';

class Enquiry extends StatefulWidget {
  const Enquiry({super.key});

  @override
  State<Enquiry> createState() => _EnquiryState();
}

class _EnquiryState extends State<Enquiry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Inbox',style: TextStyle(fontWeight: FontWeight.bold),
      
        ),
        
        
      ),
    
      body: Column(
        children: [
          Divider(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/ada2a605e6556e2142c7f9c2f9caf58c.jpg'),
                  
                ),
              ),
              Text('Alappuzha Devaaya Resourt',
              style: TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 108, 107, 107,
              
              ),
              fontSize:18,
              ),
              ),
            ],
          ),
          Column(
            children: [
              Text('Sep 15,2024 09:22 PM'),
              Text('yasminazeez: Event date:2024-09-15'),
            ],
          ),
          Divider(),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Message(),));
                
              }, icon:Icon(Icons.check_box_rounded,)),
            
          
           SizedBox(height: 50),
          IconButton(onPressed: () {
            
          }, icon:Icon(Icons.close_rounded)),
            ]),

        ],
      ),
    );
  }
}