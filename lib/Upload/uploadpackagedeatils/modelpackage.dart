class Modelpackage {
  String packagename;
  String price;
  String description;
  final String image;
  Modelpackage(
      {required this.packagename,
      required this.price,
      required this.description,
      required this.image});

  factory Modelpackage.fromMap(Map<String, dynamic> map) {
    return Modelpackage(
        packagename: map['package'] ?? 'no package',
        price: map['price'] ?? 'no price',
        description: map['description'] ?? 'no description',
        image: map['image'] ?? 'no image');
  }
  Map<String, dynamic> toMap() {
    return {
      'packagename': packagename,
      'price': price,
      'description': description,
      'image': image,
    };
  }
}
