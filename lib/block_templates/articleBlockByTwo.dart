import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp_learn/modele/article.dart';
import 'package:flutterapp_learn/modele/fakeData.dart';

class ArticleBlockByTwo extends StatelessWidget{

  final Article article1;
  final Article article2;

  ArticleBlockByTwo ({Key key, @required this.article1,this.article2 }) : super(key: key);

  final List<int> colorCodes = <int>[600, 500, 100];
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
      Expanded(
      flex: 4,
        child: Container(
            height: 392,
          margin: EdgeInsets.only(bottom: 14),
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
            boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              blurRadius: 7.0, // has the effect of softening the shadow
              spreadRadius: 5.0, // has the effect of extending the shadow
              offset: Offset(
                0, // horizontal, move right 10
                7, // vertical, move down 10
              ),
            )],
            image: DecorationImage(
              image: NetworkImage(article1.urlToImage),
              fit: BoxFit.contain,
            ),
            border: Border.all(
              color: Colors.white12,
              width: 1,
            ),

          ),
            child: Column(),
        )
      ),
    if(article2 != null)
      Expanded(
          flex: 4,
          child:
          Container(
            margin: EdgeInsets.only(left: 7, bottom: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 7.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  0, // horizontal, move right 10
                  7, // vertical, move down 10
                ),
              )],
              image:  DecorationImage(
                image: NetworkImage(article2.urlToImage),
                fit: BoxFit.contain,
              ),
              borderRadius: BorderRadius.circular(1),
              border: Border.all(
                color: Colors.white12,
                width: 1,
              ),
            ),
            height: 392,
            //margin: EdgeInsets.only(left: 49),
            child: Column(),
          )
      )



      ],
    );
  }

}

