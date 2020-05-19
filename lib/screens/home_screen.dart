import 'package:flutter/material.dart';
import 'package:grindgrain/models/category.dart';
import 'package:grindgrain/models/product.dart';
import 'package:grindgrain/services/category_service.dart';
import 'package:grindgrain/services/product_service.dart';
import 'dart:convert';
import 'package:grindgrain/widgets/home_product_categories.dart';
import 'package:grindgrain/widgets/show_product.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 
  CategoryService _categoryService=CategoryService();
  List<Category> _categoryList= List<Category>();



  ProductService _productService=ProductService();
  List<Products> _productList= List<Products>();

  var items=[];
@override
void initState() { 
  super.initState();
  
  _getAllCategories();
  _getAllProducts();
}

 
_getAllCategories() async{
  var categories= await _categoryService.getCategories();
  var result= json.decode(categories.body);
  result['data'].forEach((data){
    var model= Category();
    model.id=data['id'];
    model.name=data['categoryName'];
    model.icon=data['categoryIcon'];
    setState(() {
      _categoryList.add(model);
    });
  });
}
   _getAllProducts()async{
     var allProducts= await _productService.getProducts();
     var result= json.decode(allProducts.body);
     result['data'].forEach((data){
       var model= Products();
       model.id=data['id'];
       model.name=data['name'];
      model.price=data['price'];
      model.discount=data['discount'];
      model.photo=data['photo'];
      model.productDetail=data['detail'];
       setState(() {
         _productList.add(model);
       });
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Grind Grain'),
         backgroundColor: Colors.brown.shade500,
         actions: <Widget>[
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Container(height: 150,
             width: 30,
             child: Stack(
              children: <Widget>[
                 IconButton(
                 iconSize: 30,
                 icon: Icon(Icons.shopping_cart, color: Colors.white,),
                 onPressed: (){},
               ),
               Positioned(
                 child:Stack(
                   children: <Widget>[
                 Icon(Icons.brightness_1, size: 25, color:Colors.brown.shade50),
                 Positioned(
                   top: 4.0,
                   right: 8.0,
                   child: Center(child: Text('0',style: TextStyle(
                     color: Colors.red
                   ),)))
               ],))
              ],
               
             ),
             ),
           )
         ],
       ),
       body: Container(child: ListView(
         scrollDirection: Axis.vertical,
         children: <Widget>[
           Image.asset('images/home2.jpg',),
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Text('Multi Grain'),
           ),
           HomeProductCategories(categoryList:_categoryList),
            Padding(
             padding: const EdgeInsets.all(10.0),
             child: Text('Our products'),
           ),
           Showproduct(productList:_productList)
         ],
       ),)
    );
  }
}