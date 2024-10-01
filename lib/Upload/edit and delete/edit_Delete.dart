import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../dataupload_view/modelweddingdata/modelupload.dart';


class Edit_Delete extends StatefulWidget {
  const Edit_Delete({super.key});

  @override
  State<Edit_Delete> createState() => _Edit_DeleteState();
}

class _Edit_DeleteState extends State<Edit_Delete> {
  CollectionReference _collectionReferenceWeddingDetails =
  FirebaseFirestore.instance.collection('weddingdetails');
  late Stream<QuerySnapshot> _streamProductListItems;

  @override
  void initState() {
    super.initState();
    _streamProductListItems = _collectionReferenceWeddingDetails.snapshots();
  }

  // Delete item function
  void _deleteItem(String docId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Item"),
        content: Text("Are you sure you want to delete this item?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel')),
          TextButton(
              onPressed: () {
                _collectionReferenceWeddingDetails
                    .doc(docId)
                    .delete()
                    .then((value) => Navigator.of(context).pop())
                    .catchError((error) => print("Failed to delete: $error"));
              },
              child: Text("Delete"))
        ],
      ),
    );
  }

  // Update item function
  void _updateItem(String docId, WeddingUploadModel currentData) {
    // Controllers for input fields
    TextEditingController nameController =
    TextEditingController(text: currentData.name);
    TextEditingController descriptionController =
    TextEditingController(text: currentData.category);
    TextEditingController imageController =
    TextEditingController(text: currentData.image);
    TextEditingController priceController =
    TextEditingController(text: currentData.price);
    TextEditingController placeController =
    TextEditingController(text: currentData.place);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update Item"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name Product'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description Product'),
              ),
              TextField(
                controller: imageController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              TextField(
                controller: placeController,
                decoration: InputDecoration(labelText: 'Place'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel')),
          TextButton(
              onPressed: () {
                // Update the item in Firebase
                _collectionReferenceWeddingDetails.doc(docId).update({
                  'name': nameController.text,
                  'category': descriptionController.text,
                  'image': imageController.text,
                  'price': priceController.text,
                  'place': placeController.text,
                }).then((value) {
                  print('Item updated successfully');
                  Navigator.of(context).pop();
                }).catchError((error) => print("Failed to update: $error"));
              },
              child: Text("Update")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data from Firebase Wedding List"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _streamProductListItems,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.active) {
            QuerySnapshot querySnapshot = snapshot.data!;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            // Mapping Firestore documents to WeddingUploadModel using the factory method
            List<WeddingUploadModel> items = documents
                .map((doc) =>
                WeddingUploadModel.fromMap(doc.data() as Map<String, dynamic>))
                .toList();

            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  WeddingUploadModel thisItem = items[index];

                  return ListTile(
                    leading: thisItem.image != ''
                        ? Image.network(
                      thisItem.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                        : Icon(Icons.broken_image),
                    title: Text('${thisItem.name}'),
                    subtitle: Text('${thisItem.category}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            print(
                                "Edit button clicked for: ${thisItem.name}");
                            _updateItem(documents[index].id, thisItem);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteItem(documents[index].id),
                        ),
                      ],
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
