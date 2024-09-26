import 'package:flutter/material.dart';

class Packages extends StatefulWidget {
  const Packages({super.key});

  @override
  State<Packages> createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Kerala'),
        actions: [
          IconButton(onPressed: () {
            
          }, icon:Icon(Icons.arrow_drop_down))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select your package',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 8),
            Text('Plan your wedding with DREAMY DESTINY packages',
            style: TextStyle(fontSize: 16,
            color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Kerala Destination wedding',
            style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10),
            Card(
             
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kerala premium package',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                            SizedBox(height: 8),
                            Text('Rs 10,00000',
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Image(image: AssetImage('assets/c4d68b22-d4df-4528-ad03-ffec3822ecdd.jpg'),
                            height: 40,
                            width: 40,),
                            SizedBox(width: 10),
                            Image(image: AssetImage('assets/7c3234270d04f784b389c41994920429.jpg'),
                            height: 40,
                            width: 40,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text('Inclusions:',style:
                    TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 8),
                    Text('. Accommodation for 2 nights 200...',
                    style: TextStyle(
                      fontSize: 14
                    ),),
                    Text('. All meals inclded',
                    style: TextStyle(
                      fontSize: 14
                    ),),
                    Text('. Banquet usage for function',style: TextStyle(
                      fontSize: 14
                    ),),
                    Text('. Other License applicable',
                    style: TextStyle(
                      fontSize: 14,
                    ),),
                    SizedBox(height: 16),
                    Align(
                      alignment:
                      Alignment.centerRight,
                      child: Text('View Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        
                        
                      ),
                      ),
                    )

                  ],
                  
                ),
              ),
            ),
          ],
          
          
        ),
      ),
      

      floatingActionButton: FloatingActionButton(onPressed: () {
        
      },
      backgroundColor: Colors.green,
      child: Icon(Icons.whatshot),
      ),

    );
  }
}