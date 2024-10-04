import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'modelpackage.dart';

class Uploadpackages extends StatefulWidget {
  const Uploadpackages({super.key});

  @override
  State<Uploadpackages> createState() => _UploadpackagesState();
}

class _UploadpackagesState extends State<Uploadpackages> {
  
  String _imageUrl = '';
  bool _isuploading = false;

  TextEditingController _packagenamecontroller=TextEditingController();
  TextEditingController _pricecontroller=TextEditingController();
  TextEditingController _descriptioncontroller=TextEditingController();

   final _formkey = GlobalKey<FormState>();

   final CollectionReference _packagecollection =
      FirebaseFirestore.instance.collection('packagedetails');

  String _generateUniqueProductId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

   Future<void> addproductToFirebase() async {
    if (_formkey.currentState!.validate()) {
      String uniqueId = _generateUniqueProductId();

      
      Modelpackage uploadModel = Modelpackage(packagename: _packagenamecontroller.text, price: _pricecontroller.text, description: _descriptioncontroller.text,
      image: _imageUrl
      );
             try {
        await _packagecollection.doc(uniqueId).set(uploadModel.toMap());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Product added successlly")));

               _packagenamecontroller.clear();
        _pricecontroller.clear();
        _descriptioncontroller.clear();

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
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              children: [
                TextFormField(
                  controller: _packagenamecontroller,
                  validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please select packagename';
                      }
                      return null;
                    
                    
                    
                  },
                  decoration: InputDecoration(
                    hintText: 'packagename',
                  ),
                ),
                 TextFormField(
                    controller:_pricecontroller ,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please select price';
                      }
                      return null;
                    },
                  decoration: InputDecoration(
                    hintText: 'price',
                  ),
                ),
                 TextFormField(
                  controller: _descriptioncontroller,
                  validator: (value) {
                    if(value == null || value.isEmpty){
                      return 'please select description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'description',
                  ),
                ),
                 SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      User? user = FirebaseAuth.instance.currentUser;
                      ImagePicker picker = ImagePicker();
                      XFile? file =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (file == null) return;
                      String uniqueFileName =
                          DateTime.now().millisecondsSinceEpoch.toString();
                      setState(() {
                        _isuploading = true;
                      });
                      try {
                        Reference refrenceDirUpload =
                            FirebaseStorage.instance.ref().child('productImages/');
                        Reference referenceImageUpload =
                            refrenceDirUpload.child('$uniqueFileName.jpg');
                        await referenceImageUpload.putFile(File(file.path));
                        _imageUrl = await referenceImageUpload.getDownloadURL();
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
              
                      
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt),
                        Text('Upload image'),
                      ],
                    ),
                  ),
                    if (_isuploading) CircularProgressIndicator(),
                  if (!_isuploading)
                    _imageUrl.isNotEmpty
                        ? Container(
                            child: Image.network(
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
                    onPressed: addproductToFirebase,
                    child: Text('Submit'),
                  ),
        
          
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}