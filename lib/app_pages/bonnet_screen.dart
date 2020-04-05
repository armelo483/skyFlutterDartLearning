import 'package:flutter/material.dart';
import 'package:flutterapp_learn/block_templates/articleBlockByTwo.dart';
import 'package:flutterapp_learn/block_templates/filtresArticle.dart';
import 'package:flutterapp_learn/modele/article.dart';
import 'package:flutterapp_learn/modele/fakeData.dart';

class BonnetPage extends StatelessWidget{
  static List<List<String>> bonnets = fakeData.fakeDataArray;

  List<Article> bonnetsArticle = bonnets.map((i)=>Article.fromArray(i)).toList();

  final List<int> colorCodes = <int>[600, 500, 100];

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
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: bonnetsArticle.length,
          itemBuilder: (BuildContext context, int index) {
            var realIndex = index +1;
            var startIndex = index;
            index+=2;
            if (index == 0) {
              // return the header
              return filtreArticle();
            }else if(index<=bonnetsArticle.length -2){
              return new ArticleBlockByTwo(article1:this.bonnetsArticle[startIndex], article2:this.bonnetsArticle[realIndex]);
            }else{
              return new ArticleBlockByTwo(article1:this.bonnetsArticle[startIndex]);
            }
          }
      ),
    );
  }

}

