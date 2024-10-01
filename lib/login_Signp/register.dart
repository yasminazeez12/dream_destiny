import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_destiny/continuepage.dart';
import 'package:dream_destiny/login_Signp/login.dart';
import 'package:dream_destiny/login_Signp/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'REGISTER NOW',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),

                Text("Welcome Register to Destiny APP",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),
            
                SizedBox(height: 50,),
                TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null; // Improved return statement
                  },
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 5,),
                TextFormField(
                  controller: address,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Address is required";
                    }
                    return null; // Improved return statement
                  },
                  decoration: InputDecoration(
                    hintText: 'Address',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                 SizedBox(height: 5,),
                TextFormField(
                  controller: phoneno,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 10) {
                      return "10 digit phone number required";
                    }
                    return null; // Improved return statement
                  },
                  decoration: InputDecoration(
                    hintText: 'Phone No',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                 SizedBox(height: 5,),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    RegExp reg = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    } else if (!reg.hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null; // Improved return statement
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                 SizedBox(height:5,),
                TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null; // Improved return statement
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                
                SizedBox(height: 50,),
                Container(
                  height: 40,
                  width: 170,
                  child: TextButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        try {
                          Usermodel user1 = Usermodel(
                            name: name.text,
                            address: address.text,
                            phoneno: int.parse(phoneno.text),
                            email: email.text,
                            password: password.text,
                          );
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email.text,
                            password: password.text,
                          )
                              .then((onValue) {
                            String id = onValue.user!.uid;
                            FirebaseFirestore.instance
                                .collection("placement")
                                .doc(id)
                                .set(user1.tojson())
                                .then((onvalue) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Continuepage()));
                            });
                          });
                        } on FirebaseException catch (e) {
                          log("Error: $e");
                          // Optionally, you might want to show an error message to the user
                        }
                      }
                    },
                    child: Text(
                      'REGISTER NOW',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white), // Fixed the property type
                    ),
                  ),
                ),
                SizedBox(height: 80,),
                Row(
                  children: [
                    Text('Already registered ',style: TextStyle(color: Colors.white),),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                    }, child: Text("LogIn",style: TextStyle(color: Colors.green),)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
