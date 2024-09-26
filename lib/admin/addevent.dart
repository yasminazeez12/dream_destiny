import 'package:dream_destiny/admin/grandevent.dart';
import 'package:dream_destiny/admin/rating.dart';
import 'package:flutter/material.dart';

class Addevent extends StatefulWidget {
  const Addevent({super.key});

  @override
  State<Addevent> createState() => _AddeventState();
}

class _AddeventState extends State<Addevent> {
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
                fit:BoxFit.cover),
              ),
              child: Column(
                
                children: [
                  Text(Events[index]['text'],
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  Spacer(),
                
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Grandevent(),));
                     
                    
                  }, child: Text('ADD',
                  style: TextStyle(color: const Color.fromARGB(255, 224, 10, 81)),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white)
                  ),
                  
                  )


                ],
              ),
              
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) { 
          return SizedBox(height: 20,);
         }, itemCount:Events.length
      ),
    );
  }
}
      

    
  
