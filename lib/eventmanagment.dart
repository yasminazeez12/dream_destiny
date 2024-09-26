import 'package:flutter/material.dart';

class Eventmanagment extends StatefulWidget {
  const Eventmanagment({super.key});

  @override
  State<Eventmanagment> createState() => _EventmanagmentState();
}

class _EventmanagmentState extends State<Eventmanagment> {
  @override
  List<Map<String,dynamic>> Events=[
    {
      "image":"assets/PCG-Website-Portfolio-Page-Work-GEC.jpg",
      "text":"GRANT EVENT",

    },
    {
      "image":"assets/39.jpg",
      "text":"THE STAR EVENT",
    },
    {
      "image":"assets/PCG-Website-Portfolio-Page-Work-GEC.jpg",
      "text":"CHOICE EVENT",
    }
  ];  
    


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.pink,
      body: ListView.separated(
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(Events[index]['image'],),
                fit:BoxFit.cover)
              ),
              child: Column(
                children: [
                  Text(Events[index]['text'],
                  style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) { 
          return SizedBox(height: 20,);
         }, itemCount: 3,
      ),
    );
  }
}