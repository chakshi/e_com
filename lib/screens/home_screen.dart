import 'package:flutter/material.dart';
import 'package:grindgrain/helpers/side_drawer_navigation.dart';
import 'package:grindgrain/models/category.dart';
import 'package:grindgrain/models/product.dart';
import 'package:grindgrain/services/add_to_cart_services.dart';
import 'package:grindgrain/services/category_service.dart';
import 'package:grindgrain/services/product_service.dart';
import 'dart:convert';
import 'package:grindgrain/widgets/home_product_categories.dart';
import 'package:grindgrain/widgets/show_product.dart';

import 'cart_screen.dart';


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
  CartService _cartService = CartService();
  List<Products> _cartItems;

  var items=[];
@override
void initState() { 
  super.initState();
  
  // _getAllCategories();
  _getAllProducts();
   _getCartItems();
}



  _getCartItems() async{
    _cartItems = List<Products>();

    var cartItems = await _cartService.getCartItems();
    cartItems.forEach((data){
      var product =Products();
      product.id = data['productId'];
      product.name= data['productName'];
      product.photo = data['productPhoto'];
      product.price = data['productPrice'];
      product.discount = data['productDiscount'];
      product.productDetail= data['productDetail'] ?? 'No detail';
      product.quantity = data['productQuantity'];

      setState(() {
        _cartItems.add(product);
      });
    });
  }


 
// _getAllCategories() async{
//   var categories= await _categoryService.getCategories();
//   var result= json.decode(categories.body);
//   result['data'].forEach((data){
//     var model= Category();
//     model.id=data['id'];
//     model.name=data['categoryName'];
//     model.icon=data['categoryIcon'];
//     setState(() {
//       _categoryList.add(model);
//     });
//   });
// }
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
      drawer: SideDrawerNavigation(),
       appBar: AppBar(
         title: Text('Grind Grain'),
         backgroundColor: Colors.brown.shade500,
         actions: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen(_cartItems)));
            },

                      child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 150,
                width: 30,
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      iconSize: 30,
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    Positioned(
                        child: Stack(
                      children: <Widget>[
                        Icon(Icons.brightness_1,
                            size: 25, color: Colors.brown.shade50),
                        Positioned(
                            top: 4.0,
                            right: 8.0,
                            child: Center(
                                child: Text(
                              _cartItems.length.toString(),
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            )))
                      ],
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
       ),
       body: Container(child: ListView(
         scrollDirection: Axis.vertical,
         children: <Widget>[
           Image.asset('images/home2.jpg',),
          //  Padding(
          //    padding: const EdgeInsets.all(10.0),
          //    child: Text('Multi Grain'),
          //  ),
          //  HomeProductCategories(categoryList:_categoryList),
            Padding(
             padding: const EdgeInsets.all(10.0),
             child: Center(child: Text('Our Products', style: TextStyle(
               color: Colors.brown.shade800,
               fontSize: 25,
               fontWeight: FontWeight.bold
             ),)),
           ),
           Showproduct(productList:_productList)
         ],
       ),)
    );
  }
}