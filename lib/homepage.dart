import 'package:dream_destiny/district.dart';
import 'package:dream_destiny/inbox.dart';
import 'package:dream_destiny/profile.dart';
import 'package:dream_destiny/search.dart';
import 'package:dream_destiny/vendors.dart';
import 'package:dream_destiny/categories/weddingvenues.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex=0;
  @override
  List<Map<String,dynamic>> details=[
    {
      "image":"assets/bdb2b3175179ba0534979f0608f8997c.jpg",
      "text":"Wedding venues",
    },
     {
      "image":"assets/28 Picture Perfect Wedding Poses For Indian Couples To Try - Eternity.jpg",
      "text":"Wedding photographers",
    },
     {
      "image":"assets/b9728feb984a20de9c4d2ed1efa9cde2.jpg",
      "text":"Wedding decoraters",
    },
     {
      "image":"assets/Beautiful Hindu Bride _ Kerala Bride _ Kerala Bridal Makeup _ Hindu Wedding Makeup _ Red Silk Saree.jpg",
      "text":"Bridal makeup",
    },
   
   
  ];
  List<Map<String,dynamic>> tools=[

   { "color":const Color.fromARGB(255, 104, 228, 212),
    "text":"Your shortlisted vendours",
   },
   { "color":const Color.fromARGB(255, 224, 157, 239),
    "text":"Your Favourite ideas",
   },
   { "color":const Color.fromARGB(255, 104, 228, 212),
    "text":"Your wedding checklist",
   },
  ];
  List<Map<String,dynamic>> resorts=[
    {
      "image":"assets/Luxury Hotel in Kochi (Cochin) _ Grand Hyatt Kochi Bolgatty.jpg",
      "name":"Grand hyat",
      "place":"Ernakulam,kochi",
      "price":"Rs 3000 per plate"
    },
      {
      "image":"assets/Wedding Backdrop Decoration In Bangalore - Flower's By Design.jpg",
      "name":"Nirmaya resourt",
      "place":"Alappuzha",
      "price":"Rs 1000 per plate",

    },
      {
      "image":"assets/5 Star Luxury Resort in Bekal, Kerala - Taj Bekal Resort & Spa, Kerala.jpg",
      "name":"heaven fort",
      "place":"palakkad",
      "price":"Rs 200 per plate",

    },
  ];
  List<Map<String,dynamic>> makeup=[
    {
       "image":"assets/f1a820c4a3ca897fb4556625258d1baa.jpg",
      "name":"Lintas studio",
      "place":"Ernakulam",
      "price":"Rs 15,000",

    },
    {
       "image":"assets/563fd6ee-33c5-4839-85c3-1ba00fa6cedd.jpg",
      "name":"Blush pallete",
      "place":"malappuram",
      "price":"Rs 16,000",

    },
    {
       "image":"assets/Makeup By Purnima Sangwan.jpg",
      "name":"Dora makeup studio",
      "place":"Trissur",
      "price":"Rs 13,000",

    }
  ];
  
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => District(),));
          
        }, icon:Icon(Icons.arrow_drop_down),color: Colors.pink,),
        title: Text('Kerala',style: TextStyle(color: Colors.pink),),
        actions: [
          IconButton(onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => Search(),));
            
            
          }, icon:Icon(Icons.search_rounded)),
           IconButton(onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => Inbox(),));
            
          }, icon:Icon(Icons.message)),
           IconButton(onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Profile(),));

            
          }, icon:Icon(Icons.person)),
          
          

        ],
      ),
    
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection:Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: details.length,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Weddingvenues(),
                        
                          ));
                          
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(details[index]["image"],
                              
                              
                              ),
                          
                                        
                            ),
                            Text(details[index]["text"])
                          ],
                        ),
                      ),
                    );
                    
                    
                      
                  },
                  
                
                  ),
                ),
              ),
            ),
            SizedBox(height:10),
            Divider(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Wedding planning tools'),
                ),
                SizedBox(width:5),
                Container(
                  height: 30,
                  width: 60,
                   decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 67, 166, 49),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'New',style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  ),
              ],),
               SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection:Axis.horizontal,
                shrinkWrap: true,
                itemCount: tools.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 130,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(10),
                       ),
                       color:tools[index]["color"],
                       
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(tools[index]["text"])),
                  ),
                    
                 ) ,
                 );
                  },
                  ),
                  ) ,
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Venues in your city'),
                      ),
                    ],
                  ),
                   SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection:Axis.horizontal,
                shrinkWrap: true,
                itemCount: resorts.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 130,
                    
                    
                     decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(resorts[index]["image"])),
                       borderRadius: BorderRadius.all(Radius.circular(20),
                       ),
                       ),
         ),
         
         
         );
         
         },
        
        
         )
        ),
        SizedBox(height:30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
              height:30,
              width: 300,
              decoration: BoxDecoration(
                
              ),
              child: TextButton(onPressed:  () {
                
              }, child:Text('View all venues',
              style: TextStyle(color: const Color.fromARGB(255, 255, 147, 59)),),
              style: ButtonStyle(
                shape:WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    side: BorderSide(
                      color: const Color.fromARGB(255, 240, 141, 48),
                    )
                  )
                )
                
              ),
             
              ),
            )
          ],
        ),
         SizedBox(height:5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Bridal makeup for you'),
                      ),
                    ],
                  ),
                    SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection:Axis.horizontal,
                shrinkWrap: true,
                itemCount: makeup.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 130,
                    
                    
                     decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(makeup[index]["image"])),
                       borderRadius: BorderRadius.all(Radius.circular(20),
                       ),
                       ),
         ),
         
         
         );
         
         },
        
        
         )
        ),
         SizedBox(height:30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
              height:30,
              width: 300,
              decoration: BoxDecoration(
                
              ),
              child: TextButton(onPressed:  () {
                
              }, child:Text('View all ',
              style: TextStyle(color: const Color.fromARGB(255, 255, 147, 59)),),
              style: ButtonStyle(
                shape:WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    side: BorderSide(
                      color: const Color.fromARGB(255, 240, 141, 48),
                    )
                  )
                )
                
              ),
             
              ),
            )
          ],
        ),
        
        
        
        
        
        
        ] ),
      ),
      


      ) ;}
       }
                     

       
       
      
                
                
      
    
  



                

                

                
              
              
               
            
          
          
  