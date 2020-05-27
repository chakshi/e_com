class Shipping{
  int id;
  String name;
  String email;
  String phone;
  String address;
  

  toJson(){
    return {
      'id' : id.toString(),
      'name' : name,
      'email' : email,
      'phone':phone,
      'address' : address,
     
    };
  }
}