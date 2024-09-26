import 'package:dream_destiny/admin/addevent.dart';
import 'package:flutter/material.dart';

class Adlogin extends StatefulWidget {
  const Adlogin({super.key});

  @override
  State<Adlogin> createState() => _AdloginState();
}

class _AdloginState extends State<Adlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  Colors.pink,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
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
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => Addevent(),));
                
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
    );
  }
}
      
    
  
