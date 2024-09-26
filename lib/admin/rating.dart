import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  List<Map<String,dynamic>> rating=[
    {
      "image":"assets/PCG-Website-Portfolio-Page-Work-GEC.jpg",
      "text":"GRANT EVENT",
      "icon":Icon(Icons.rate_review)
    },
    {
       "image":"assets/39.jpg",
      "text":"STAR EVENT",
      "icon":Icon(Icons.rate_review)

      
    },
    {
       "image":"assets/PCG-Website-Portfolio-Page-Work-GEC.jpg",
      "text":"CHOICE EVENT",
      "icon":Icon(Icons.rate_review)
    }
  ];
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(itemBuilder:(context, index) {
        return Padding(padding: EdgeInsets.all(0.8),
        child: Container(
          height:200 ,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
              rating[index]["image"],
            ),
            fit: BoxFit.cover
            )
          ),
          child:Column(
            children: [
              Text(rating[index]["text"],
              ),
              rating[index]['icon'],
            ],
          ) ,
          
          
        ),
        );
        
      }, separatorBuilder: (context, index) {
        return SizedBox(height: 20);
        
      }, itemCount:rating.length),
    );
  }
}