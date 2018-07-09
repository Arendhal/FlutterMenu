import 'package:flutter/material.dart';
import 'dart:math';
import 'data.dart';
import 'details.dart';
import 'details_text.dart';

Positioned card(
    DecorationImage decorationImage,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context,
    Function dismissCardImage,
    int index,
    Function addCardImage,
    Function swipeRight,
    Function swipeLeft) {
  Size screenSize = MediaQuery.of(context).size;
  int indexText = imageData.length;
  return new Positioned(
    bottom: 100.0 + bottom,
    right: index == 0 ? right != 0.0 ? right : null : null,
    left: index == 1 ? right != 0.0 ? right : null : null,
    child: new Dismissible(
        key: new Key(new Random().toString()),
        crossAxisEndOffset: -0.4,
        onResize: () {},
        onDismissed: (DismissDirection direction) {
          if (direction == DismissDirection.endToStart)
            dismissCardImage(decorationImage);
          else{
            addCardImage(decorationImage);
          }
        },
        child: new Transform(
            alignment:
                index == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
            transform: new Matrix4.skewX(skew),
            child: new RotationTransition(
                turns: new AlwaysStoppedAnimation(
                    index == 0 ? rotation / 360 : rotation / -360),
                child: new Hero(
                    tag: "image",
                    child: new GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new DetailPage(decorationImage: decorationImage)
                ));
                        },
                        child: new Card(
                            color: Colors.transparent,
                            elevation: 4.0,
                            child: new Container(
                              alignment: Alignment.center,
                              width: screenSize.width / 1.2 + cardWidth,
                              height: screenSize.height / 1.7,
                              decoration: new BoxDecoration(
                                color: new Color.fromRGBO(24,139,239, 1.0),
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                              child: new Column(children: <Widget>[
                                new Container(
                                    width: screenSize.width / 1.2 + cardWidth,
                                    height: screenSize.height / 2.2,
                                    decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.only(
                                            topLeft: new Radius.circular(10.0),
                                            topRight: new Radius.circular(10.0)),
                                        image: decorationImage),   
                                      child: new Padding(
                                        padding: EdgeInsets.only(top:screenSize.height / 2.41),
                                        child:new Text(articleTitle(indexText),style: new TextStyle(fontSize: 25.0,color: Colors.white),) //TITRE ARTICLE
                                      )),                   
                                new Container(
                                    width: screenSize.width / 1.2 + cardWidth,
                                    height: screenSize.height / 1.7 -
                                        screenSize.height / 2.2,
                                    alignment: Alignment.center,
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        new FlatButton(
                                            padding: new EdgeInsets.all(0.0),
                                            onPressed: () {
                                              swipeLeft();
                                              if(imageData.length!=0)
                                              imageData.length--;
                                            },
                                            child: new Container(
                                              height: 60.0,
                                              width: 130.0,
                                              alignment: Alignment.center,
                                              decoration: new BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        60.0),
                                              ),
                                              child: new Text(
                                                "Plus tard",
                                                style: new TextStyle(
                                                    color: Colors.white),
                                              ),                                
                                            )),
                                        new FlatButton(
                                            padding: new EdgeInsets.all(0.0),
                                            onPressed: () {
                                               Navigator.push(
                                                context, 
                                                MaterialPageRoute( builder:(context)=> new DetailPage(decorationImage: decorationImage,))
                                              );
                                            },
                                            child: new Container(
                                              height: 60.0,
                                              width: 130.0,
                                              alignment: Alignment.center,
                                              decoration: new BoxDecoration(
                                                color: Colors.cyan,
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        60.0),
                                              ),
                                              child: new Text(
                                                "Lire plus...",
                                                style: new TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ))
                                      ],
                                    ))
                              ]),
                            ))))))),
  );
}
