import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_destiny/dataupload_view/modelweddingdata/modelupload.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Uploadwedding extends StatefulWidget {
  const Uploadwedding({super.key});

  @override
  State<Uploadwedding> createState() => _UploadweddingState();
}

class _UploadweddingState extends State<Uploadwedding> {
  String _selectcategory = '';
  String _imageUrl = '';
  bool _isuploading = false;
   TextEditingController _placecontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _pricecontroller = TextEditingController();
  // TextEditingController _photographerscontroller=TextEditingController();
 

  final _formkey = GlobalKey<FormState>();

  final CollectionReference _weddingcollection =
      FirebaseFirestore.instance.collection('weddingdetails');

  String _generateUniqueProductId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  Future<void> addproductToFirebase() async {
    if (_formkey.currentState!.validate()) {
      String uniqueId = _generateUniqueProductId();

      WeddingUploadModel uploadModel = WeddingUploadModel(
          category: _selectcategory,
          place: _placecontroller.text,
          name: _namecontroller.text,
          price: _pricecontroller.text,
          
          image: _imageUrl);

      try {
        await _weddingcollection.doc(uniqueId).set(uploadModel.toMap());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Product added successlly")));


         _placecontroller.clear();
        _namecontroller.clear();
        _pricecontroller.clear();
       

        // _CategoriesProductController.clear();
        setState(() {
          _selectcategory = '';
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
        title: Text('Upload page'),
      ),
      body: Center(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DropdownButtonFormField(
                  value: _selectcategory.isNotEmpty ? _selectcategory : null,
                  items: [
                    'venues',
                    'photographers',
                    ' makeup',
                    'decorators',
                    'food',
                  ]
                      .map(
                        (category) => DropdownMenuItem(
                            value: category, child: Text(category)),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectcategory = value ?? '';
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please select category';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: ' category'),
                ),
                SizedBox(
                  height: 20,
                ),
                  TextFormField(
                  controller: _placecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please select place';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: 'place'),
                ),
                TextFormField(
                  controller: _namecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please select name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'name',
                  ),
                ),
                TextFormField(
                  controller: _pricecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please select price';
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: ' price'),
                ),
              
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    User? user = FirebaseAuth.instance.currentUser;
                    ImagePicker _imagePicker = ImagePicker();
                    XFile? file =
                        await _imagePicker.pickImage(source: ImageSource.gallery);
                    if (file == null) return;
                    String _uniqueFileName =
                        DateTime.now().millisecondsSinceEpoch.toString();
                    setState(() {
                      _isuploading = true;
                    });
                    try {
                      Reference _refrenceDirUpload =
                          FirebaseStorage.instance.ref().child('productImages/');
                      Reference _referenceImageUpload =
                          _refrenceDirUpload.child('$_uniqueFileName.jpg');
                      await _referenceImageUpload.putFile(File(file.path));
                      _imageUrl = await _referenceImageUpload.getDownloadURL();
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
