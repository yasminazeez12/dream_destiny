import 'package:dream_destiny/profileview.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  List<Map<String,dynamic>>buttons=[{
    "icon":Icon(Icons.inbox),
    "text":"Inbox"},
    {
    "icon":Icon(Icons.note),
    "text":"My bookings"},
    {
    "icon":Icon(Icons.reviews),
    "text":"Write a review"},
    {
    "icon":Icon(Icons.room_service),
    "text":"Genie services"},
    {
    "icon":Icon(Icons.call),
    "text":"Contact & Support"},

{
    "icon":Icon(Icons.rate_review),
    "text":"Rate on app store"},
    {
    "icon":Icon(Icons.share),
    "text":"Share"},
  
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: CircleAvatar(
                  child: IconButton(onPressed: () {
                    
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profileview(),));
                  }, icon:Icon(Icons.person))
                  
                  
                  
                ),
                
              ),
              Text('Yasminazeez',style:TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 53, 52, 52,)),
              
              
              ),

              
              
            ],
          ),
          Text('View profile'),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}