import 'package:dream_destiny/events/eventscallvendor.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Alappuzha Devaaya Resort',
        style: TextStyle(fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 56, 55, 55)),
        
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Eventscallvendor(),));
            
          }, icon:Icon(Icons.arrow_circle_right))
        ],
        
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 250,
            color: const Color.fromARGB(255, 245, 229, 234),
            child: Text('Event Date:2024-09-15 Requiremwnts are:Function Type:Pre-Wedding,function Time:evening,Number of guest:50,Rooms required:300,Entered Contact No:9656107838')),
          Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.person_2_rounded),
                backgroundColor: const Color.fromARGB(255, 233, 231, 231),
                
              ),
              SizedBox(width: 10),
              Text('yasminazeez'),
            ],
          ),
          SizedBox(height: 450,),
          Column(
          
            crossAxisAlignment: CrossAxisAlignment.end,
            
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 250,
                      color: Colors.white,
                      child: TextButton(onPressed:  () {
                        
                      }, child:Text('Type message...',
                      style: TextStyle(color:Colors.grey))),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(onPressed: () {
                      
                    }, child:Text('Send',style: TextStyle(color: Colors.white),),
                    style:ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.pink)
                    ),
                    ),
                  )
                ],
              ),
            ],
          )
         
      

        ],
        
      ),
      
    );
  }
}