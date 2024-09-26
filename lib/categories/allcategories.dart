import 'package:dream_destiny/categories/photographers.dart';
import 'package:flutter/material.dart';

class Allcategories extends StatefulWidget {
  const Allcategories({super.key});

  @override
  State<Allcategories> createState() => _AllcategoriesState();
}

class _AllcategoriesState extends State<Allcategories> {


Widget _categorycard(String title,Widget destinationpage){
  
  return 
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>destinationpage,));
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  color:const Color.fromARGB(255, 224, 163, 235),
                  child: Row(
                    children: [
                      Text(title),
                      Spacer(),
                      Container(
                        height: 80,
                        width:80,
                        color: const Color.fromARGB(255, 164, 236, 167),
                      ), 
                      
                    ],
                  ),
                  
                ),
              ),
              SizedBox(height: 20,)
            ],
          );
          

}






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kerala'),
        actions: [
          IconButton(onPressed: () {
            
          }, icon:Icon(Icons.search)),
          IconButton(onPressed: () {
            
          }, icon:Icon(Icons.upload))
        ],
      ),
      body: Column(
        children: [
          _categorycard('photo', Photographers())
        ],
       
      ),
    );
  }
}