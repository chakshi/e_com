class Products{
int id;
String name;
String photo;
int price;
int discount;
String productDetail;
int quantity;


tomap(){
  var map= Map<String, dynamic>();
  map['productid']=id;
  map['productName']= name;
  map['productPrice']=price;
  map['productDiscount']= discount;
  map['productQuantity']=quantity;
  map['productPhoto']=photo;
  return map;
}
forMap(){
  
}
}
