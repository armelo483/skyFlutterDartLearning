import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as JSON;
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'app_pages/home_screen.dart';

void main() => runApp(BlackAngelsShop());

class BlackAngelsShop extends StatefulWidget {
  const BlackAngelsShop({ Key key,this.destination }) : super(key: key);
  final Destination destination;
  @override
  _BlackAngelsShopState createState() => _BlackAngelsShopState();
}

class _BlackAngelsShopState extends State<BlackAngelsShop> {
  int _selectedIndex = 0;
  int _currentIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Black Angel\'s' ,
      home: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(child:Row(
              children: <Widget>[
            Container(color: Colors.red, height: 7.0)]),
            preferredSize: Size.fromHeight(10.0)),
            title: Text('Black Angel\'s'),
            backgroundColor: Colors.grey,
        elevation: 23,),
        body: HomePage(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: allDestinations.map((Destination destination) {
            return BottomNavigationBarItem(
                icon: Icon(destination.icon),
                backgroundColor: destination.color,
                title: Text(destination.title)
            );
          }).toList(),
        ),
      ),

    );
  }

}




class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Accueil', Icons.home, Colors.teal),
  Destination('Favoris', Icons.stars, Colors.amber),
  Destination('Info sur BA', Icons.info, Colors.grey),
  Destination('Mon compte', Icons.supervised_user_circle, Colors.blue)
];


