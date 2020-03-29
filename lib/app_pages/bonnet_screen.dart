import 'package:flutter/material.dart';

class BonnetPage extends StatelessWidget{

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(child:Row(
            children: <Widget>[
              Container(color: Colors.black26, height: 5.0,)]),
            preferredSize: Size.fromHeight(10.0)),
        title: Text('Bonnets'),
        backgroundColor: Colors.grey,
        elevation: 23,),
      body: Center(
        child: Text('Page 21'),
      ),
    );
  }

}