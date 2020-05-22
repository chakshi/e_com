import 'package:flutter/material.dart';
import 'package:grindgrain/models/product.dart';
import 'package:grindgrain/screens/cart_screen.dart';
import 'package:grindgrain/services/add_to_cart_services.dart';

class ProductDetail extends StatefulWidget {
  final Products products;
  ProductDetail(this.products);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CartService _cartService = CartService();
List<Products> _cartItems;
@override
  void initState() { 
    super.initState();
    _getCartItems();
  }
    _getCartItems() async {
    _cartItems = List<Products>();
    var cartItems = await _cartService.getCartItems();
    cartItems.forEach((data){
      var product = Products();
      product.id = data['productId'];
      product.name = data['productName'];
      product.photo = data['productPhoto'];
      product.price = data['productPrice'];
      product.discount = data['productDiscount'];
      product.productDetail = data['productDetail'] ?? 'No detail';
      product.quantity = data['productQuantity'];

      setState(() {
        _cartItems.add(product);
      });
    });
  }

  _addToCart(BuildContext context, Products products) async {
    var result = await _cartService.addToCart(products);
    if (result > 0) {
       _getCartItems();
      _showSnackMessage(Text(
        'Item added to cart successfully!',
        style: TextStyle(color: Colors.green),
      ));
     
    } else {
      
      _showSnackMessage(Text('Failed to add to cart!', style: TextStyle(color: Colors.red),));
    }
  }

  _showSnackMessage(message) {
    var snackBar = SnackBar(
      content: message,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(this.widget.products.name),
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
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Image.network(this.widget.products.photo),
                ),
              ),
              footer: Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                ),
                child: Container(
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        this.widget.products.name.toUpperCase(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 18.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '₹${this.widget.products.price - this.widget.products.discount}',
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '₹${this.widget.products.price}',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.brown.shade100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      _addToCart(context, this.widget.products);
                    },
                    textColor: Colors.brown,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Add to cart',
                          style: TextStyle(
                              color: Colors.redAccent, fontSize: 18.0),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.redAccent,
                            ),
                            onPressed: () {})
                      ],
                    )),
                IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.redAccent,
                    ),
                    onPressed: null)
              ],
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Product Details',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(this.widget.products.productDetail),
            ),
          )
        ],
      ),
    );
  }
}
