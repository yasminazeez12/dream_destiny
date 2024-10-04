import 'package:dream_destiny/Upload/uploadideas/uploadideas.dart';
import 'package:dream_destiny/Upload/uploadpackagedeatils/upload%20data/1_UI_uploadpackages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dataupload_view/uploadweddingdata/uploaddata.dart';
import 'edit and delete/edit_Delete.dart';

class Uploadselect extends StatelessWidget {
  const Uploadselect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Uploadideas(),
                  ));
                },
                child: Text("Upload Ideas")),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Uploadpackages(),
                  ));
                },
                child: Text("Upload Package")),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Uploadwedding(),
                  ));
                },
                child: Text("Upload Wedding")),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Edit_Delete(),
                  ));
                },
                child: Text("Upload And Delete",style: TextStyle(color: Colors.red),)),
          ],
        ),
      ),
    );
  }
}
