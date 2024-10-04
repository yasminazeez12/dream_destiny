import 'dart:developer';

import 'package:dream_destiny/Navbar/vendors.dart';
import 'package:dream_destiny/admin/addevent.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final String adminemail='admin@gmail.com';
final String adminpassword ="admin@123";

class Adlogin extends StatefulWidget {
  const Adlogin({super.key});

  @override
  State<Adlogin> createState() => _AdloginState();
}

class _AdloginState extends State<Adlogin> {
    TextEditingController email = TextEditingController(text: 'admin@gmail.com');
  TextEditingController password = TextEditingController(text: 'admin@123');
  final Formkey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Colors.pink,
      body: Form(
        key: Formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        
            children: [
              TextFormField(
                 controller: email,
                  validator: (value) {
                    RegExp reg = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    } else if (!reg.hasMatch(value)) {
                      return "Enter a valid email";
                    } else {
                      return null;
                    }
                  },

                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                 controller: password,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return "Password must be at least 6 characters";
                    } else {
                      return null;
                    }
                  },
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white
                ),
              ),
              SizedBox(height: 20),
              Container(
                height:60,
                width: 160,
                child: TextButton(onPressed: () {
                   if (Formkey.currentState!.validate()??false) {
                    if(email.text == adminemail && 
                    password.text == adminpassword){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Allcategories(),));

                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Email or password is incorrect'))
                      );
                    }
                       
                      }
                    
                  
                  
                   


                   
                  
                }, child: Text('LOGIN',style: TextStyle(
                  fontSize: 20,
                  color:Colors.black,
                ),),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white)
                ),
                ),
              )
              
        
              
            ],
          ),
        ),
      ),
    );
  }
}
      
    
  
