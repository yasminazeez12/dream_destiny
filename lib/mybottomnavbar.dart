import 'package:dream_destiny/categories/allcategories.dart';
import 'package:dream_destiny/homepage.dart';
import 'package:dream_destiny/ideas.dart';
import 'package:dream_destiny/packages.dart';
import 'package:dream_destiny/vendors.dart';
import 'package:flutter/material.dart';

 class Mybottomnavbar extends StatefulWidget {
  const Mybottomnavbar({super.key});

  @override
  State<Mybottomnavbar> createState() => _MybottomnavbarState();
}

class _MybottomnavbarState extends State<Mybottomnavbar> {
  int selectedIndex=0;
  var pages=[
    Homepage(),
    Allcategories(),
    Ideas(),
    Packages(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:pages[selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(items:[
        BottomNavigationBarItem(icon:Icon(Icons.home),
        label: 'HOME'),
        BottomNavigationBarItem(icon:Icon(Icons.business),
        label: 'VENDORS'),
        BottomNavigationBarItem(icon:Icon(Icons.stars),
        label: 'IDEAS'),
        BottomNavigationBarItem(icon:Icon(Icons.card_giftcard),
        label: 'PACKGES'),
        
                
      ],
      elevation: 3,
      type: BottomNavigationBarType.shifting,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.pink,
      
      currentIndex: selectedIndex,
      onTap:(int index){
        setState(() {
          selectedIndex=index;
          
          
        });
      }

      ),

    );
  }
}