import 'package:flutter/material.dart';
import 'package:grindgrain/models/product.dart';
import 'package:grindgrain/screens/product_detail.dart';

class ShowAllProduts extends StatefulWidget {
  final Products products;

  ShowAllProduts(this.products);

  @override
  _ShowAllProdutsState createState() => _ShowAllProdutsState();
}

class _ShowAllProdutsState extends State<ShowAllProduts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
       child: InkWell(
         onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetail(this.widget.products)));
         },
                child: Card(child: Column(children: <Widget>[
           Text(widget.products.name, style: TextStyle(fontWeight: FontWeight.bold,
           fontSize: 18
           ),),
           Image.network(widget.products.photo,width:190.0, height:140.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('₹${widget.products.price.toString()}', 
              style: TextStyle(color: Colors.redAccent,
              fontSize: 16
              ),
              
              ),
              Text('Discount ${widget.products.discount.toString()}%', 
              style: TextStyle(
                color: Colors.green
              ),
              ),
          ],)
         ],),),
       ),
    );
  }
}