import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:grindgrain/models/product.dart';
import 'package:grindgrain/models/shipping.dart';
import 'package:grindgrain/services/shipping_address.dart';

class PaymentScreen extends StatefulWidget {
  final List<Products> cartItems;
  PaymentScreen({this.cartItems});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _cardHolderName = TextEditingController();
  final _cardHolderEmail = TextEditingController();
  final _cardNumber = TextEditingController();
  final _expiryMonth = TextEditingController();
  final _expiryYear = TextEditingController();
  final _cvcNumber = TextEditingController();

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Make payment'),
        backgroundColor: Colors.redAccent,
        leading: Text(''),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 28.0, top: 28.0, right: 28.0, bottom: 14.0),
              child: Text('Make payment',
                  style:
                      TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
            ),
            Divider(
              height: 5.0,
              color: Colors.black,
            ),
            Padding(
            padding: const EdgeInsets.only(
                left: 28.0, top: 14.0, right: 28.0, bottom: 14.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: _cardHolderEmail,
              decoration: InputDecoration(hintText: 'Email'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                left: 28.0, top: 14.0, right: 28.0, bottom: 14.0),
            child: TextField(
              controller: _cardHolderName,
              decoration: InputDecoration(hintText: 'Name'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                left: 28.0, top: 14.0, right: 28.0, bottom: 14.0),
            child: TextField(
              controller: _cardNumber,
              decoration: InputDecoration(
                hintText: 'Card Number',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                left: 28.0, top: 14.0, right: 28.0, bottom: 14.0),
            child: TextField(
              controller: _expiryMonth,
              decoration: InputDecoration(
                hintText: 'Expiry Month',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                left: 28.0, top: 14.0, right: 28.0, bottom: 14.0),
            child: TextField(
              controller: _expiryYear,
              decoration: InputDecoration(
                hintText: 'Expiry Year',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
                left: 28.0, top: 14.0, right: 28.0, bottom: 14.0),
            child: TextField(
              controller: _cvcNumber,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'CVC',
              ),
            ),
          ),
            Column(
              children: <Widget>[
                ButtonTheme(
                  minWidth: 320.0,
                  height: 45.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    color: Colors.redAccent,
                    onPressed: () {
                      
                    },
                    child: Text('Make Payment',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _shipping(BuildContext context, Shipping shipping) async {
    var _shippingService = ShippingService();
    var shippingData = await _shippingService.addShipping(shipping);
    var result = json.decode(shippingData.body);
    if (result['result'] == true) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => PaymentScreen(
      //               cartItems: this.widget.cartItems,
      //             )));
    } else {
      _showSnackMessage(Text('Failed to add shipping', style: TextStyle(color: Colors.red),));
    }
  }
}
