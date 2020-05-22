import 'package:grindgrain/models/product.dart';
import 'package:grindgrain/repository/repository.dart';
class CartService{
 Repository _repository;
 CartService(){
   _repository = Repository();
 }
 addToCart(Products products) async{
    List<Map> items =await _repository.getLocalByCondition('carts', 'productId', products.id);
    if(items.length>0){
      products.quantity = items.first['productQuantity']+1;
      return await _repository.updateLocal('carts', 'productId', products.tomap());
    }

   
   products.quantity=1;
   return await _repository.savelocal('carts', products.tomap());
   }

   getCartItems() async {
    return await _repository.getAllLocal('carts');
  }
   deleteCartItemById(int id) async {
     print(id);
    return await _repository.deleteLocalById('carts', id);
    
  }

  makeTheCartEmpty() async {
    return await _repository.deleteLocal('carts');
  }
   
}