import 'package:dream_destiny/categories/weddingvenues.dart';
import 'package:dream_destiny/dataupload_view/uploadweddingdata/uploaddata.dart';
import 'package:flutter/material.dart';

class Vendors extends StatefulWidget {
  const Vendors({super.key});

  @override
  State<Vendors> createState() => _ForyouState();
}

class _ForyouState extends State<Vendors> {
  @override
  List<Map<String,dynamic>> vendors=[
    {
      "color":const Color.fromARGB(255, 230, 149, 245),
      "text":"Venues",
      "image":"assets/0e2bb03fc87bd002a83f180cea3b2161.png",
    },
     {
      "color":const Color.fromARGB(255, 236, 192, 125),
      "text":"Photographers",
      "image":"assets/30+ South Indian Couples Who Colour Coordinated Their Outfits Like A Pro!.jpg",
    },
     {
      "color":const Color.fromARGB(255, 233, 157, 147),
      "text":"Makeup",
      "image":"assets/Minimal Makeup Look _ Olready.jpg",
    },
     {
      "color":const Color.fromARGB(255, 159, 227, 239),
      "text":"Planning & Decor",
      "image":"assets/Beach Wedding Ideas _ Indian Beach Wedding _ Destination wedding _ BookEventz.jpg",
    },
     {
      "color":const Color.fromARGB(255, 240, 225, 114),
      "text":"Food",
      "image":"assets/Chicken Milega Kya_.jpg",
    },
    
    
    
    

  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Kerala',
          style: TextStyle(fontSize:13,fontWeight: FontWeight.bold),),
        ),
        actions: [
          IconButton(onPressed:  () {
            
          }, icon:Icon(Icons.search),
          ),
           IconButton(onPressed:  () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Uploadwedding(),));
            
          }, icon:Icon(Icons.upload),
          ),
          

        ],

      ),
      body: ListView.separated(itemBuilder: (context, index) {
        return Padding(padding: EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Weddingvenues(),));
          },
          child: Container(
            
            height: 100,
            width: 100,
            color:vendors[index]["color"],
           child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(vendors[index]["text"],
                style: TextStyle(fontWeight: FontWeight.bold),),
          
              ),
              Spacer(),
              Image(image: AssetImage(vendors[index]["image"],
              ),
              
              
              
              
              ),
              
            ],
           ),
          
          ),
        ),
        );
        
      }, separatorBuilder:(context, index) {
        return SizedBox(height: 10);
        
      } , itemCount:vendors.length),
     
    );
  }
}