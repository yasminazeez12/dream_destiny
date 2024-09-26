import 'package:dream_destiny/people.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  List<Map<String,dynamic>> images=[
    {
      "image":"assets/engagment.jpg",
      "text":"Engagment Cermony",
    },
      {
      "image":"assets/b02573e3987fcffc8353dee4b56c3245.jpg",
      "text":"Wedding Cermony",
    },
      {
      "image":"assets/haldhi.jpg",
      "text":"Haldhi Cermony",
    },
      {
      "image":"assets/787f57a7db6375396f1dfa209dd4aa77.jpg",
      "text":"Wedding party",
    },
    


  ];
  List<Map<String,dynamic>>pictures=[{
    "picture":"Beach wedding",
    "text":"assets/pexels-asadphoto-169196.jpg",
  },
  {
    "picture":"assets/1_aLx62KwH7-elY9o9z-xbNw.jpg",
    "text":"Balcony wedding",
  
  },
   {
    "picture":"assets/db200480bc0b12785949c4c251cb2f38.jpg",
    "text":"Garden wedding",
  
  },
  

  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text('Categories',style: TextStyle(
          color: Colors.pink
        ),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('You are looking for',
            style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 400,
          child: GridView.builder(
            itemCount: images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          ), itemBuilder:(context, index) {
            return Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(images[index]['image'],
                ),
                fit: BoxFit.cover)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(images[index]["text"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                ],
              ),
            );
          },),
          
          ),
           Spacer(),
            Container(
              height: 50,
              width: 150,
              child: TextButton(onPressed: () {

                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>People(),));
            
              }, child:Text('Done',
               style: TextStyle(color:Colors.white),
               ),
                style:ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(  const Color.fromARGB(255, 225, 71, 128))
              ) ,
              
               
               ),
            ),
         
        ],
      ),
      
    );
  }
}