import 'package:flutter/material.dart';
import 'package:flutterapp_learn/app_pages/bonnet_screen.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.black12 ,
      child: ListView(
        padding: const EdgeInsets.all(2),
        children: <Widget>[
          SizedBox(
            height: 124.0,
            child:  Container(
              margin: EdgeInsets.fromLTRB(2,4,2,2),
              decoration: BoxDecoration(
                color: const Color(0xfff),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                  ),],
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
              child:SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(_createRoute());
                              },
                      child:Container(
                      height: 80.0,
                      width: 80.0,
                      margin: EdgeInsets.only(left: 7),
                      decoration: new BoxDecoration(
                        image: DecorationImage(
                          image: new AssetImage(
                              'images/echarpe.jpg'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    )),
                          Padding(
                              padding: EdgeInsets.only(left: 7),
                              child: Text('Echarpe', style: TextStyle(fontSize: 18))
                          ),
                        ]
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 80.0,
                            width: 80.0,
                            margin: EdgeInsets.only(left: 35),
                            decoration: new BoxDecoration(
                              image: DecorationImage(
                                image: new AssetImage(
                                    'images/casquette22.jpg'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 35),
                              child: Text('Casque', style: TextStyle(fontSize: 18))
                          ),
                        ]
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      Container(
                        height: 80.0,
                        width: 80.0,
                        margin: EdgeInsets.only(left: 35),
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: new AssetImage(
                                'images/bonnet.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),

                          Padding(
                              padding: EdgeInsets.only(left: 35),
                              child: Text('Bonnet', style: TextStyle(fontSize: 18))
                          ),
                        ]
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 80.0,
                            width: 80.0,
                            margin: EdgeInsets.only(left: 35),
                            decoration: new BoxDecoration(
                              image: DecorationImage(
                                image: new AssetImage(
                                    'images/chapeau.jpg'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),

                          Padding(
                              padding: EdgeInsets.only(left: 35),
                              child: Text('Chapeau', style: TextStyle(fontSize: 18))
                          ),
                        ]
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 80.0,
                            width: 80.0,
                            margin: EdgeInsets.only(left: 35),
                            decoration: new BoxDecoration(
                              image: DecorationImage(
                                image: new AssetImage(
                                    'images/tshirt.jpg'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),

                          Padding(
                              padding: EdgeInsets.only(left: 35),
                              child: Text('T-shirt', style: TextStyle(fontSize: 18))
                          ),
                        ]
                    ),

                  ]
              )
          ),
          ),
      ),
          SizedBox(
            width: double.infinity,
            height: 300.0,
            child: Container(
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 500.0,
            child: Container(
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                  ),],
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          )
    ],
  )
      /*child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
          child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: ExactAssetImage('images/echarpe.jpg'),
              minRadius: 20,
              maxRadius: 30,
            ),
            CircleAvatar(
              backgroundImage: ExactAssetImage('images/echarpe.jpg'),
              minRadius: 20,
              maxRadius: 30,
            ),
          ]
      )
      )*/
    );
  }

}


Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => BonnetPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 0.3);
      var end = Offset.zero;
      var curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}