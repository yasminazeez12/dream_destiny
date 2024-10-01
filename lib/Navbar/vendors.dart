import 'package:dream_destiny/categories/makeup.dart';
import 'package:dream_destiny/categories/photographers.dart';

import 'package:flutter/material.dart';

import '../Upload/UploadSelect.dart';
import '../Upload/uploadideas/uploadideas.dart';
import '../categories/decorations.dart';
import '../categories/food.dart';
import '../categories/weddingvenues.dart';
import '../dataupload_view/uploadweddingdata/uploaddata.dart';

class Allcategories extends StatefulWidget {
  const Allcategories({super.key});

  @override
  State<Allcategories> createState() => _AllcategoriesState();
}

class _AllcategoriesState extends State<Allcategories> {
  //this is template by using class

  Widget _categorycard(
      String title, Widget destinationpage, String image, Color color) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => destinationpage,
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            height: 100,
            width: double.infinity,
            color: color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // SizedBox(width: 250,),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kerala'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Uploadselect(),
                ));
              },
              icon: Icon(Icons.upload)),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _categorycard(
                'PHOTOGRAPHY',
                Photographers(),
                'assets/0e2bb03fc87bd002a83f180cea3b2161.png',
                Colors.cyanAccent),
            _categorycard(
                'WEDDING VENUE',
                Weddingvenues(),
                'assets/5 Star Luxury Resort in Bekal, Kerala - Taj Bekal Resort & Spa, Kerala.jpg',
                Colors.greenAccent),
            _categorycard("FOOD", Food(), "assets/Chicken Milega Kya_.jpg",
                Colors.yellow),
            _categorycard(
                "DECORATERS",
                Decorations(),
                "assets/e4a57eb77677f1de2a0b9e36ad8b1257.jpg",
                Colors.purpleAccent),
            _categorycard("MAKEUP", Makeup(),
                "assets/Minimal Makeup Look _ Olready.jpg", Colors.orangeAccent)
          ],
        ),
      ),
    );
  }
}
