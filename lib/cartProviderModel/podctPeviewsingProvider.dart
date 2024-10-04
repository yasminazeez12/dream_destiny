import 'package:dream_destiny/cartProviderModel/FavouriteListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../chat.dart';
import '../dataupload_view/modelweddingdata/modelupload.dart';
import 'cart_model.dart';

class ProductPreviewProvider extends StatelessWidget {
  final WeddingUploadModel detailedProduct;

  const ProductPreviewProvider({
    Key? key,
    required this.detailedProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context); // Access CartModel

    return Scaffold(
      appBar: AppBar(
        title: Text("Wedding Destiny"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartScreenProvider()));
            },
            icon:Icon(Icons.favorite,color: Colors.red,)
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: detailedProduct.image.isNotEmpty
                ? Image.network(
                    detailedProduct.image,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.broken_image, size: 100),
          ),
          const SizedBox(height: 16),
          Text(
            detailedProduct.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            detailedProduct.place,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  cart.addToCart(detailedProduct); // Add product to cart

                  // Show a SnackBar message when product is added
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${detailedProduct.name} added to cart'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child:Icon( Icons.favorite_border,
                color: Colors.red,
                
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ));
                  },
                  child: Text("Message",
                  style: TextStyle(color: Colors.red),)),
            ],
          ),
        ],
      ),
    );
  }
}
