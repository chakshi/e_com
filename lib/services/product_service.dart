
import 'package:grindgrain/repository/repository.dart';
class ProductService{
Repository _repository;

ProductService(){
  _repository=Repository();
  
}
getProducts() async{
  return await _repository.httpGet('products');
}
}