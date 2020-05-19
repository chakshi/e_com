import 'package:flutter/material.dart';

class HomeProductCategory extends StatefulWidget {
  final String categoryIcon;
  final String categoryName;
  HomeProductCategory(this.categoryIcon, this.categoryName);

  @override
  _HomeProductCategoryState createState() => _HomeProductCategoryState();
}

class _HomeProductCategoryState extends State<HomeProductCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 120.0,
       width: 190.0,
       child: Card(child: Column(children: <Widget>[
         Image.network(widget.categoryIcon,width:190.0, height:140.0),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(widget.categoryName),
         )
       ],),),
    );
  }
}