import 'package:flutter/material.dart';
import 'package:grindgrain/screens/cart_screen.dart';
import 'package:grindgrain/screens/home_screen.dart';
class SideDrawerNavigation extends StatefulWidget {
  SideDrawerNavigation({Key key}) : super(key: key);

  @override
  _SideDrawerNavidationState createState() => _SideDrawerNavidationState();
}

class _SideDrawerNavidationState extends State<SideDrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown.shade600,
      child: Drawer(
        child: Container(
          color: Colors.brown.shade50,
          child:
          ListView(children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown.shade500
              ),
              accountName: Text('Chakshu Panchal'),
               accountEmail: Text('panchalchikki11@gmail.com'), 
               currentAccountPicture: GestureDetector(child:CircleAvatar(radius: 50,
               child: Icon(Icons.person, size: 50,),
               )),
               ),
            ListTile(
              title: InkWell(
                onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));},
                child: Text('Home')),
              leading: Icon(Icons.home),
            ),
             
          ],)
        )
        ,
      ),
    );
  }
}