import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_destiny/Upload/uploadideas/modelideas.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Uploadideas extends StatefulWidget {
  const Uploadideas({super.key});

  @override
  State<Uploadideas> createState() => _UploadideasState();
}

class _UploadideasState extends State<Uploadideas> {

  String _imageUrl = '';
  bool _isuploading = false;

   final _formkey = GlobalKey<FormState>(); // step 1: using for submitting button
   final CollectionReference _ideascollection =
      FirebaseFirestore.instance.collection('ideascollection'); // step:2 creating a collection name in firebase

  String _generateUniqueProductId() {
    return DateTime.now().millisecondsSinceEpoch.toString(); // creating a unique product name
  }
   Future<void> addproductToFirebase() async {          // after submitting button then function will execute
    if (_formkey.currentState!.validate()) {
      String uniqueId = _generateUniqueProductId();    // step 3:passing collection name to new name


      ideasUploadModel upload =ideasUploadModel(image: _imageUrl);

         
           try {
        await _ideascollection.doc(uniqueId).set(upload.toMap());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Product added successlly")));

             setState(() {
              _imageUrl = ''; // Clear image after submission
        });
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Product added failed $e ")));
      }
    }
  }
              




  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload ideas'),
      ),
      body: Form(
        key: _formkey,
        child: Center(
          child: Column(
            children: [
                ElevatedButton(                            //step 4:to image upload
                    onPressed: () async {                     
                      User? user = FirebaseAuth.instance.currentUser;
                      ImagePicker _imagePicker = ImagePicker();      // step 5: image picking function
                      XFile? file =
                          await _imagePicker.pickImage(source: ImageSource.gallery);  // step 6: if .camera for opening camera   
                      if (file == null) return;
                      String _uniqueFileName =
                          DateTime.now().millisecondsSinceEpoch.toString();            // step 7:create image file name
                      setState(() {
                        _isuploading = true;
                      });
                      try {
                        Reference _refrenceDirUpload =
                            FirebaseStorage.instance.ref().child('ideasImages/');   // step 8:to create folder in firebase storage ('ideasImages/');
                        Reference _referenceImageUpload =
                            _refrenceDirUpload.child('$_uniqueFileName.jpg');
                        await _referenceImageUpload.putFile(File(file.path));
                        _imageUrl = await _referenceImageUpload.getDownloadURL();  // step 9 :to get image URL
                        setState(() {
                          _isuploading = false;
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Error in image uploading")));
                        setState(() {
                          _isuploading = false;
                        });
                      }
              
                      ;
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt),
                        Text('Upload image'),
                      ],
                    ),
                  ),
                  if (_isuploading) CircularProgressIndicator(),  // to see loading
                  if (!_isuploading)
                    _imageUrl.isNotEmpty
                        ? Container(
                            child: Image.network(   // to show upload image
                              _imageUrl,
                              height: 200,
                              width: 200,
                              fit: BoxFit.fitHeight,
                            ),
                          )
                        : Icon(
                            Icons.image,
                            size: 150,
                            color: Colors.grey,
                          ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  ElevatedButton(
                    onPressed: addproductToFirebase,   // calling future function
                    child: Text('Submit'),
                  ),
        
            ],
          ),
        ),
      ),

    );
  }
}