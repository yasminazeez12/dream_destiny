import 'package:flutter/material.dart';

class Ideas extends StatefulWidget {
  const Ideas({super.key});

  @override
  State<Ideas> createState() => _IdeasState();
}

class _IdeasState extends State<Ideas> {
  @override
  List<Map<String,dynamic>> pic=[
      {
      "image":"assets/Gorgeous Kerala Wedding With 2 Equally Stunning Ceremonies.jpg",
      "icon":Icon(Icons.favorite_outline),
    },
      {
      "image":"assets/Fun haldi shots of bride and groom.jpg",
      "icon":Icon(Icons.favorite_outline),
      
    },
      {
      "image":"assets/4b8a9c2a4e66ef04eb35dce6b76dc1a3.jpg",
      "icon":Icon(Icons.favorite_outline),
      
    },
      {
      "image":"assets/0e2880f14e9443d15bef994f8ae90ce4.jpg",
     "icon":Icon(Icons.favorite_outline),
    },

  ];

  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        
        centerTitle:true,
        title:Text('Ideas',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
        elevation: 0,
        
       
        actions: [
          IconButton(onPressed:  () {
            
          }, icon:Icon(Icons.search),
          ),
           IconButton(onPressed:  () {
            
          }, icon:Icon(Icons.favorite),
          ),
         

        ],
      

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Photos',
            style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 500,
          child: GridView.builder(
            itemCount: pic.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          ), itemBuilder:(context, index) {
            return Container(
              height: 600,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(pic[index]["image"],
                ),
                
                
                
                fit: BoxFit.cover)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(onPressed: () {
                    
                  }, icon:pic[index]['icon'],color: Colors.white,)
                ],
                
              ),
            );
          },),
          
          ),
         
        ],
      ),
      
         );
          
  }}











             