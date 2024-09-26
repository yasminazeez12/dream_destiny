import 'package:flutter/material.dart';

class Adminview extends StatefulWidget {
  const Adminview({super.key});

  @override
  State<Adminview> createState() => _AdminviewState();
}

class _AdminviewState extends State<Adminview> {
  @override
  List<Map<String,dynamic>>details=[
    {
      "name":"Grand events",
      "ownername":"ownername:Yasmin azeez",
      "phoneno":"phone no:98456272013",
    },
     {
      "name":"Grand events",
      "ownername":"ownername:Yasmin azeez",
      "phoneno":"phone no:98456272013",
    },
     {
      "name":"Grand events",
      "ownername":"ownername:Yasmin azeez",
      "phoneno":"phone no:98456272013",
    },
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView.separated(itemBuilder: (context, index) {
          return Padding(padding: EdgeInsets.all(0.8),
          child: Container(
            height: 200,
            width: 150,
            child: Column(
              children: [
                Text(details[index]["name"],
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(details[index]["ownername"]),
                  ],
                ),
                Text(details[index]["phoneno"]),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {
                      
                    }, child:Text('accept')),
                    SizedBox(width: 30),
                     ElevatedButton(onPressed: () {
                      
                    }, child:Text('reject')),
                  ],
                ),
                
                
              ],
            ),
          ),);
        }, separatorBuilder:(context, index) {
          return SizedBox(height: 20);
        }, itemCount:details.length),
      ),

    );
  }
}