class Shipping{
  int id;
  String name;
  String email;
  String address;
  

  toJson(){
    return {
      'id' : id,
      'name' : name,
      'email' : email,
      'address' : address,
     
    };
  }
}