import 'package:flutter/material.dart';
import 'package:grindgrain/models/category.dart';

import 'home_product-category.dart';

class HomeProductCategories extends StatefulWidget {
   final List<Category> categoryList;
  HomeProductCategories({this.categoryList});

  @override
  _HomeProductCategoriesState createState() => _HomeProductCategoriesState();
}

class _HomeProductCategoriesState extends State<HomeProductCategories> {
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
         itemCount: this.widget.categoryList.length,
         itemBuilder: (context, index) {
         return HomeProductCategory(this.widget.categoryList[index].icon, this.widget.categoryList[index].name);
        },
       ),
    );
  }
}