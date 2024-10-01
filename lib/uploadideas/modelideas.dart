class ideasUploadModel{
  final String image;
  ideasUploadModel({required this.image});


  factory ideasUploadModel.fromMap(Map<String,dynamic>map){
    return ideasUploadModel(image: map['image']??'no image',
    );
  }
  Map<String,dynamic>toMap(){
    return{
      'image':image,
    };
  }

}