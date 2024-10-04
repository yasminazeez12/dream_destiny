import 'dart:developer';
import 'package:dream_destiny/Startingpage.dart';
import 'package:dream_destiny/admin/adlogin.dart';
import 'package:dream_destiny/continuepage.dart';
import 'package:dream_destiny/Navbar/homepage.dart';
import 'package:dream_destiny/Navbar/mybottomnavbar.dart';
import 'package:dream_destiny/login_Signp/register.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController(text: 'yasi@gmail.com');
  TextEditingController password = TextEditingController(text: 'yasi123');
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,

      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Adlogin(),));
                      
                    }, child:Text('Admin')),
                  ],
                ),
                SizedBox(height: 10,),
                Text("Welcome back to Destiny APP",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white),),

                SizedBox(height: 50,),

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
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
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
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 60,
                  width: 160,
                  child: TextButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email.text.trim(),
                            password: password.text.trim(),
                          );
                          log(FirebaseAuth.instance.currentUser!.uid);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Continuepage()));
                        } on FirebaseAuthException catch (e) {
                          log('Error: $e');
                          // Optionally, show an error message to the user
                        }
                      }
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                  ),

                ),
                TextButton(
                    onPressed: () {}, child: Text('Forgot Password?',style: TextStyle(color: Colors.white),)),
                SizedBox(height: 100),

                Row(
                  children: [
                    Text('Still not registerd ',style: TextStyle(color: Colors.white),),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register()));
                    }, child: Text("Register",style: TextStyle(color: Colors.green),)),
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
