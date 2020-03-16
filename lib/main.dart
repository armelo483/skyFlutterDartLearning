import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert' as JSON;
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


void main() => runApp(MaterialApp(
  title: 'French News',
  home: new PageAccueil(),
));
//inspiration de : https://www.youtube.com/watch?v=Ee2ol1LYPFY et https://www.youtube.com/watch?v=aIJU68Phi1w

class PageAccueil extends StatefulWidget {

  @override
  PageAccueilState createState() => new PageAccueilState();

}

class PageAccueilState extends State<PageAccueil> {

  final String url = 'http://newsapi.org/v2/top-headlines?country=fr&apiKey=5a2985a54e294033aaca3464ed368893';
  List<FrenchNews> news;

  Future<String> _getJsonData() async {
    var response = await http.get(Uri.encodeFull(url),headers: {"Accept": "application/json"});
    setState(() {
      var convertedResponseInJson = JSON.jsonDecode(response.body);
       //news = FrenchNews.fromJson(convertedResponseInJson['articles'];
      var list = convertedResponseInJson['articles'] as List;
      //news = list.map((i) => FrenchNews.fromJson(i)).toList();
      news = list.map((i)=>FrenchNews.fromJson(i)).toList();
    });

    return 'Success !!';
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getJsonData();
  }
static const kRouteName = '/PageAccueil';
  int _id;

  PageAccueilState({Key key, @required this.news});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Colors.blue,//NavBar et footbar
        brightness: Brightness.light,
        accentColor: Colors.cyan[600],//Boutton floattant
        textTheme: TextTheme(title: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal,color: Colors.black),
            body1: TextStyle(color: Colors.white),
            headline: TextStyle(fontSize: 72.0,color: Colors.white, fontWeight: FontWeight.bold)),//Police
        fontFamily: 'Georgia',

      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Actualités françaises'),
        ),
        body:ListView.separated(
          itemCount: (news==null)?0:news.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 60,
                  maxWidth: 69,
                  maxHeight: 69,
                ),
                child: Image.network(news[index].urlToImage, fit: BoxFit.cover),
              ),
              title: Text(news[index].title,style: GoogleFonts.crimsonText(),),
              onTap:(){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => _DetailArticle(frenchNews:this.news[index])));
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    ) ;
  }
}

class _DetailArticle extends StatelessWidget{
  final FrenchNews frenchNews;
  _DetailArticle({Key key, @required this.frenchNews}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détail info"),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 7.0,right: 7,top: 0),
        children: <Widget>[
          Container(
            //height: 750,
            margin: EdgeInsets.only(top: 7),
            child: Image.network(frenchNews.urlToImage)
          ),
          Container(
            margin: EdgeInsets.only(top: 7),
            child: Text(frenchNews.content, textAlign: TextAlign.justify,style: Theme.of(context).textTheme.title),
          ),
        ],
      )/*Row(
        children: <Widget>[
          Expanded(
            child: Text('Deliver features faster', textAlign: TextAlign.justify,style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
          ),
        ],
      )*/
    );
  }
}

class FrenchNews {
  final String title;
  final String description;
  final String urlToImage;
  final String content;

  FrenchNews({this.title, this.description,this.urlToImage,this.content});

  factory FrenchNews.fromJson(Map<String, dynamic> usersjson)=> FrenchNews(
      title: usersjson["title"],
      description: usersjson["description"],
      urlToImage: usersjson["urlToImage"],
      content: usersjson["content"]
  );
}

class FrenchNewsList {
  final List<FrenchNews> frenchNews;

  FrenchNewsList({
    this.frenchNews,
  });
  factory FrenchNewsList.fromJson(List<dynamic> parsedJson) {

    List<FrenchNews> frenchNewsList = new List<FrenchNews>();

    return new FrenchNewsList(
      frenchNews: frenchNewsList,
    );
  }
}





