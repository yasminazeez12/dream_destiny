import 'package:dream_destiny/profiledetails/gendertoggle.dart';
import 'package:flutter/material.dart';

class Profilebody extends StatelessWidget {
  const Profilebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [CircleAvatar(
                radius: 50,
                backgroundColor:Colors.grey,
                child: Icon(Icons.person,
                size: 50,
                color: Colors.white,
                ),
              
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name'
                  ),
                  onChanged: (value) {
                    
                  },
                ))
                  
                ],
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gendertoggle(),
                
                  
                ],
              )
              ],
            ),
          ),
          SizedBox(height: 32,),
          ListTile(
            title: Text('Set Email'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              
            },
          ),
          Divider(),
          ListTile(
            title: Text('Mobile Number'),
            subtitle: Text('+9656107838'),
            trailing: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Text('Verified',
              style: TextStyle(color: const Color.fromARGB(255, 238, 242, 238)),),
            ),
          
          ),
          Divider(),
          SwitchListTile(
            title: Text('Get updates on Whatsapp'),
            value:false, onChanged:(value) {
            
          },),
          SizedBox(height: 32,),

          Center(
            child: TextButton(onPressed: () {
              
            }, child: Text('Delete my account',
            style: TextStyle(
              color: Colors.red
            ),)),
          )
        ],
      ),
    );
  }
}