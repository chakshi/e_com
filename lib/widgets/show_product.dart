import 'package:flutter/material.dart';
import 'package:grindgrain/models/product.dart';

import 'package:grindgrain/widgets/show_all_products.dart';



class Showproduct extends StatefulWidget {
   final List<Products> productList;
  Showproduct({this.productList});

  @override
  _ShowproductState createState() => _ShowproductState();
}

class _ShowproductState extends State<Showproduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 1000,

      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: this.widget.productList.length,
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
        itemBuilder: (BuildContext context,  index){
            return ShowAllProduts(this.widget.productList[index]);
        }
        
        )
    );
  }
}