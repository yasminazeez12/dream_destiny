import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_destiny/categories/productpreview.dart';
import 'package:dream_destiny/dataupload_view/modelweddingdata/modelupload.dart';
import 'package:flutter/material.dart';

import '../cartProviderModel/podctPeviewsingProvider.dart';



// Ensure this import is correct

class Photographers extends StatefulWidget {   // step 1 : create statefull widget
  const Photographers({super.key});

  @override
  State<Photographers> createState() => _PhotographersState();
}

class _PhotographersState extends State<Photographers> {   
  late Stream<QuerySnapshot> _streamweddingitems;           // step 2: creating this name custom _streamweddingitems

  @override
  void initState() {
    super.initState();                                   // step 3 :to call firebase,firestore
    _streamweddingitems = FirebaseFirestore.instance
        .collection('weddingdetails')
        .where('category', isEqualTo: 'photographers')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,
        title: const Text("Wedding photograpers"),
      ),
      


      body: StreamBuilder<QuerySnapshot>(                     // step 4 : calling streambuilder
        stream: _streamweddingitems,                         // step 5 : calling step 2 name
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.active) {
            List<WeddingUploadModel> items = snapshot.data!.docs            // saving firebase snapshots in items         
                .map((doc) => WeddingUploadModel.fromMap(                    //(change current model name)
                    doc.data() as Map<String, dynamic>))
                .toList();

            return GridView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                WeddingUploadModel thisItem = items[index];     // converting firebase list in to this item(changing with index)
                log('Image URL: ${thisItem.image}');       // not important       

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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductPreviewProvider(
                                            detailedProduct: thisItem,
                                          )));
                            },
                            child: Text("View"))
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