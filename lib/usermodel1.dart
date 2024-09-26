class Usermodel1 {
  final String name;
  final String address;
  final int phoneno;
  final String email;
  final String password;
   
    Usermodel1({
    required this.name,
    required this.address,
    required this.phoneno,
    required this.email,
    required this.password,
  });
  factory Usermodel1.fromjson(Map<String,dynamic>json){
    return Usermodel1(
      name:json['name'],
      address:json['address'],
      phoneno:json['phoneno'],
      email:json['email'],
      password:json['password'],
    );
  }
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