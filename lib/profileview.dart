import 'package:flutter/material.dart';

class Profileview extends StatefulWidget {
  const Profileview({super.key});

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  String gender='Female';
  bool getupdatesonwhatsapp=true;
  String mobilenumber='9656107838';
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text('Yasminazeez',
            style: TextStyle(fontSize: 20,),),
            trailing: IconButton(
              onPressed:() {
                
              }, icon:Icon(Icons.edit)),

          ),
          SizedBox(height: 20),
          Text('Gender',
          style: TextStyle(
            fontSize: 18
          ),
          ),
          Row(
            children: [
              Expanded(child: RadioListTile<String>(
                title: Text('Female'),
                value: 'Female', groupValue:AutofillHints.gender, onChanged: (value) {
                  setState(() {
                    gender=value!;

                    
                  });
                  
                  
                },)),
                Expanded(child: RadioListTile<String>(value: 'Male', groupValue:gender, onChanged:(value) {
                  setState(() {
                    gender=value!;
                  });
                },))
            ],
          ),
          SizedBox(height: 20),
          Text('Mobile Number',style: TextStyle(
            fontSize: 18
          ),),
          ListTile(
            title: Text(mobilenumber),
            trailing: Text('Verified',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold
            ),),
            
          ),
          SizedBox(height: 20),
          Text('Get updates on whatsapp',
          style: TextStyle(
            fontSize: 18,
          ),),
          ListTile(
            leading: Icon(Icons.facebook,
            color: Colors.blue),
            title: Text(mobilenumber),
            trailing: Switch(value: getupdatesonwhatsapp, onChanged:(value) {
              getupdatesonwhatsapp=value;
            },),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(onPressed: () {
              
            },
           
             child:Text('Delete my acccount',
             style: TextStyle(color: Colors.red),)),
          ),

        ],
      ),
      
    );
  }
}