import 'package:flutter/material.dart';

class Callvendor extends StatefulWidget {
  const Callvendor({super.key});

  @override
  State<Callvendor> createState() => _CallvendorState();
}

class _CallvendorState extends State<Callvendor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Call vendor',style: TextStyle(fontSize: 25),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Verify your mobile to contact the vendor',style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            Text('Full name*',style: 
            TextStyle(color: Colors.grey),),
            Text('Yasminazeez'),
            Divider(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/ce7c51e57e47d19165267fc4760dfcae.jpg'),
                      fit:BoxFit.cover)
                    ),
                  ),
                  Text('+91 9656107838'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Function date*',style: TextStyle(color:Colors.grey),),
                  Divider(),
                  SizedBox(height:400),
                  
                  Divider(),

                  ElevatedButton(onPressed: () {
                    
                  },
                  
                   child: Text('Call',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  style: ButtonStyle(
                    backgroundColor:WidgetStatePropertyAll(Colors.green),
                  ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}