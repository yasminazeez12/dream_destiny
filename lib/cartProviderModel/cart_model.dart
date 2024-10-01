import 'package:flutter/material.dart';

import '../Upload/uploadpackagedeatils/modelpackage.dart';
import '../dataupload_view/modelweddingdata/modelupload.dart';

class CartModel extends ChangeNotifier{
  final List<WeddingUploadModel> _cartitems =[];

  List<WeddingUploadModel> get CartItems => _cartitems;

  void addToCart(WeddingUploadModel product){
    _cartitems.add(product);

    notifyListeners();// This will update any widget that listens to this model
  }
  void removeFromCart(WeddingUploadModel producttt){
    _cartitems.remove(producttt);// Notify listeners about removal
    notifyListeners();
  }

  double get totalPrice => _cartitems.fold(0.0, (total,current)=> total +double.parse(current.price));

  bool iaInCart(WeddingUploadModel product){
    return _cartitems.contains(product);
  }


}