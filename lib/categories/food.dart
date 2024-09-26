import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_destiny/categories/productpreview.dart';
import 'package:dream_destiny/dataupload_view/modelweddingdata/modelupload.dart';
import 'package:flutter/material.dart';



// Ensure this import is correct

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  late Stream<QuerySnapshot> _streamweddingitems;

  @override
  void initState() {
    super.initState();
    _streamweddingitems = FirebaseFirestore.instance
        .collection('weddingdetails')
        .where('category', isEqualTo: 'food')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,
        title: const Text("food"),
      ),
      
      // bottomNavigationBar: BottomAppBar(child: Container(
      //   width: double.infinity,
      //   height: 50,
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [IconButton(
      //       icon: Icon(size: 30,Icons.home_outlined),
      //       color: Colors.blue ,
      //       onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>LandingPage()));
      //       },
      //     ),
      //       IconButton(
      //         icon: Icon(size: 30,
      //           Icons.cleaning_services,),
      //         color: Colors.grey ,
      //         onPressed: () {
      //         },
      //       ),
      //       IconButton(
      //         icon: Icon(size: 30,
      //           Icons.shopping_cart_outlined,),
      //         color: Colors.grey ,
      //         onPressed: () {
      //         },
      //       ),IconButton(
      //         icon: Icon(size: 30,
      //           Icons.person_2_outlined,),
      //         color: Colors.grey ,
      //         onPressed: () {
      //         },
      //       ),IconButton(
      //         icon: Icon(size: 30,
      //           Icons.cleaning_services,),
      //         color: Colors.grey ,
      //         onPressed: () {
      //         },
      //       ),

      //     ],),
      // ),),


      body: StreamBuilder<QuerySnapshot>(
        stream: _streamweddingitems,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.active) {
            List<WeddingUploadModel> items = snapshot.data!.docs
                .map((doc) => WeddingUploadModel.fromMap(
                    doc.data() as Map<String, dynamic>))
                .toList();

            return GridView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                WeddingUploadModel thisItem = items[index];
                log('Image URL: ${thisItem.image}');

                return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.shade300,
                          width: 2), // Border color and width
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        thisItem.image.isNotEmpty
                            ? Image.network(thisItem.image,
                                width:
                                    double.infinity, // Adjust width as needed
                                height: 120, // Adjust height as needed
                                fit: BoxFit.cover, errorBuilder:
                                    (BuildContext context, Object exception,
                                        StackTrace? stackTrace) {
                                return Icon(Icons.broken_image, size: 50);
                              } // Fallback in case of error
                                )
                            : const Icon(Icons.broken_image, size: 60),
                        // Adjust icon size as needed
                        const SizedBox(
                            height: 8), // Space between image and text
                        Text(
                          thisItem.name.isNotEmpty
                              ? thisItem.name
                              : 'Name not available',
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                        ),
                        Text('Price:  ${thisItem.price.toString()}\$'),
                        Text('place:${thisItem.place.toString()}'),
                        TextButton(
                            onPressed: () {
                             
                            },
                            child: Text("FOR BUY"))
                      ],
                    ));
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                mainAxisSpacing: 10, // Space between rows
                crossAxisSpacing: 10, // Space between columns
                childAspectRatio:
                    .7, // Aspect ratio of each grid item or height adjust
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}