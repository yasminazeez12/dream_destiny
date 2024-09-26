import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dream_destiny/usermodel.dart';

class Databasemethods {

  Stream<List<Usermodel>>getInstitutionsStream(){
    return FirebaseFirestore.instance
    .collection('users')
    .snapshots()
    .map((snapshots){
      return snapshots.docs.map((doc){
        return Usermodel.fromjson(doc.data());
      }).toList();
    });
  }
  
  


}