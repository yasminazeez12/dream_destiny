import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_destiny/Navbar/homepage.dart';
import 'package:flutter/material.dart';
import '../Upload/uploadideas/modelideas.dart';

class Ideas extends StatefulWidget {
  const Ideas({super.key});

  @override
  State<Ideas> createState() => _IdeasState();
}

class _IdeasState extends State<Ideas> {
  late Stream<QuerySnapshot> _streamideasitems;

  @override
  void initState() {
    super.initState();
    _streamideasitems =
        FirebaseFirestore.instance.collection('ideascollection').snapshots();
  }

  // This will hold the list of favorited items (you can change the logic as needed)
  List<bool> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Ideas',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Homepage(),
              ));
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _streamideasitems,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.connectionState == ConnectionState.active) {
            List<ideasUploadModel> items = snapshot.data!.docs
                .map((doc) => ideasUploadModel
                .fromMap(doc.data() as Map<String, dynamic>))
                .toList();

            // Initialize the favorites list with false values
            if (favorites.length != items.length) {
              favorites = List.generate(items.length, (index) => false);
            }

            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Photos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3),
                    itemCount: items.length, // Number of items in the list
                    itemBuilder: (context, index) {
                      ideasUploadModel idea = items[index];

                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                idea.image.isNotEmpty
                                    ? Image.network(
                                  idea.image,
                                  height: 190,
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
                                )
                                    : const Icon(Icons.broken_image, size: 50),
                              ],
                            ),
                          ),
                          // Positioned to display the love icon on the top right corner
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              icon: Icon(
                                favorites[index]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: favorites[index] ? Colors.red : Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  favorites[index] = !favorites[index];
                                });
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(child: Text('No ideas found.'));
        },
      ),
    );
  }
}
