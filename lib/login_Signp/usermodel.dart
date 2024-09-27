class Usermodel {
  final String name;
  final String address;
  final int phoneno;
  final String email;
  final String password;

  Usermodel({
    required this.name,
    required this.address,
    required this.phoneno,
    required this.email,
    required this.password,
  });
  factory Usermodel.fromjson(Map<String,dynamic>json){
    return Usermodel(
      name:json['name'],
      address:json['address'],
      phoneno:json['phoneno'],
      email:json['email'],
      password:json['password'],
      
    );
  }
  // get docs=>null;
  Map<String,dynamic>tojson(){
    return{
      'name':name,
      'address':address,
      'phoneno':phoneno,
      'email':email,
      'password':password,
    };
  }

  

}