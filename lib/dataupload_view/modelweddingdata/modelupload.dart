import 'package:flutter/foundation.dart';

class WeddingUploadModel{
  String category;
  String name;
  String price;
  String place;
  final String image;
   WeddingUploadModel({required this.category,required this.name,required this.price,required this.place,
   required this.image
   });
   
   factory WeddingUploadModel.fromMap(Map<String,dynamic>map){
    return WeddingUploadModel(
      category: map['category']??'no category',
      name: map['name']??'no name ',
      price: map['price']??'no price',
      place: map['place']??'no place',
      image: map['image']??'no image',
      
    );
    

   }
   Map<String,dynamic>toMap(){
    return{
      'category':category,
      'name':name,
      'price':price,
      'place':place,
      'image':image,
    };
   }

}
