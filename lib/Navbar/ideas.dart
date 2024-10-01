import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_destiny/Navbar/homepage.dart';
import 'package:dream_destiny/dataupload_view/modelweddingdata/modelupload.dart';
import 'package:dream_destiny/uploadideas/modelideas.dart';
import 'package:dream_destiny/uploadpackagedeatils/modelpackage.dart';
import 'package:flutter/material.dart';

class Ideas extends StatefulWidget {
  const Ideas({super.key});

  @override
  State<Ideas> createState() => _IdeasState();
}

class _IdeasState extends State<Ideas> {
  late Stream<QuerySnapshot>_streamideasitems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamideasitems=FirebaseFirestore.instance.collection('ideascollection').snapshots();
  }


  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ideas',
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
        leading: IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homepage(),));
          
        }, icon:Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {
            
          }, icon:Icon(Icons.search)),
          IconButton(onPressed:  () {
            
          }, icon:Icon(Icons.favorite)),
        ],
      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: _streamideasitems,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot) {
          if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }
          if(snapshot.connectionState == ConnectionState.active){
            List<ideasUploadModel> items = snapshot.data!.docs.map((doc)=>ideasUploadModel.fromMap(doc.data() as Map<String,dynamic>)).toList();
              

          }
          return Column(
            children: [
              Padding(padding: EdgeInsets.all(8.0),
              child: Text('Photos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
          
              ),),
              ),
              SizedBox(height: 500,
              child: GridView.builder(
                
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              crossAxisSpacing: 3,mainAxisSpacing: 3), itemBuilder: (context, index) {
                   
                   //BALANCE UNDD 

                return Container(
                  height: 600,
                  width: 400,
                  
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                      
                      
                    )
                  ),
                  
                
                );
              },),
              ),
            ],
          );
        }
      ),
    );
  }
}