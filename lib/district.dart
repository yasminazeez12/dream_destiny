import 'package:flutter/material.dart';

class District extends StatefulWidget {
  const District({super.key});

  @override
  State<District> createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  @override
  List place=[
    "Kasarkod",
    "Kannur",
    "Kozhikod",
    "Vayanad",
    "Malppuram",
    "Plakkad",
    "trissur",
    "Ernakulam",
  ];


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
        title: Text('Select district',style:
        TextStyle(fontSize:27,fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Use Current Location',style: 
            TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
          ),
          SizedBox(height: 30),
          Text('All district',style: TextStyle(
            fontSize:20,fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 10,),
          ListView.separated(itemBuilder: (context, index) {
            return SizedBox(height: 5);
            
          }, separatorBuilder:(BuildContext,int index) => Text("place"[index]), itemCount:place.length)
         
          
        ],
      ),
    );
  }
}