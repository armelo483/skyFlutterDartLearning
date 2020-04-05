import 'package:flutter/material.dart';
import 'package:flutterapp_learn/modele/article.dart';
import 'package:flutterapp_learn/modele/fakeData.dart';

class filtreArticle extends StatelessWidget{
  final List<List<String>> bonnets = fakeData.fakeDataArray;
  final List<int> colorCodes = <int>[600, 500, 100];
  Widget build(BuildContext context) {
    return  new Row(children: <Widget>[
      Expanded(
        child: Text('Classer', textAlign: TextAlign.center),
      ),
    ],);
  }
  }



