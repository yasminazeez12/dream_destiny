import 'package:dream_destiny/Navbar/homepage.dart';

import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextFormField(
              
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search',
                suffixIcon: IconButton(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homepage(),));
                  
                }, icon:Icon(Icons.cancel),
                ),
               
              
            
                
              ),
            ),
          )
        ],
      ),
    );
  }
}