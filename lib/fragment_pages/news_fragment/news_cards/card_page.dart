import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'card.dart';
import 'card_fake.dart';
import 'data.dart';
import 'card_animation.dart';

class CardPage extends StatefulWidget {
  @override
  CardPageState createState() => new CardPageState();
}

class CardPageState extends State<CardPage> with TickerProviderStateMixin {
 
  AnimationController _animController;
  int index = 0;

  List data = imageData;
  List selectedData = [];

  void initState() {
    super.initState();
    _animController = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);

    rotate = new Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(new CurvedAnimation(parent: _animController, curve: Curves.ease));
    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          var i = data.removeLast();
          data.insert(0, i);
          _animController.reset();
        }
      });
    });

    right = new Tween(
      begin: 0.0,
      end: 400.0,
    ).animate(new CurvedAnimation(
      parent: _animController,
       curve: Curves.ease));

    bottom = new Tween<double>(
      begin: 15.0, 
      end: 100.0).animate(
        new CurvedAnimation(
          parent: _animController, 
          curve: Curves.ease));

    width = new Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(new CurvedAnimation(
      parent: _animController,
      curve: Curves.bounceOut,
    ));
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future _swipeAnimation() async {
    try {
      await _animController.forward();
    } on TickerCanceled {
      print("TickerCanceled");
    }
  }

  swipeRight() {
    if (index == 0) {
      setState(() {
        index = 1;
        if(imageData.length!=0)
        {
         imageData.length--;
        }
      });
      _swipeAnimation();
    }
  }

  swipeLeft() {
    if (index == 1) {
      setState(() {
        index = 0;
      });
    }
    _swipeAnimation();
  }

  dismissCardImage(DecorationImage image) {
    setState(() {
      data.remove(image);
    });
  }

  addCardImage(DecorationImage image) {
    setState(() {
      data.remove(image);
      selectedData.add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.6;
    var dataLength = data.length;
    num initialBottom = 12.0;
    num backCardWidth = -10.0;
    num backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    return (new Scaffold(
        appBar: new AppBar(
            elevation: 0.0,
            backgroundColor: Colors.blue,
            centerTitle: true,
            leading: new Container(
                margin: const EdgeInsets.all(1.0),
                child: new GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: new Icon(Icons.arrow_back_ios,
                        color: Colors.white, size: 30.0))),
            //actions: <Widget>[],
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                    padding: EdgeInsets.only(right: 0.0),
                    child: new Text(
                      "ACTUALITES",
                      style: new TextStyle(
                        fontSize: 13.0,
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                new Padding(
                    padding: EdgeInsets.only(right: 44.0),
                    child: new Container(
                      width: 15.0,
                      height: 15.0,
                      margin: new EdgeInsets.only(bottom: 20.0),
                      alignment: Alignment.center,
                      child: new Text(dataLength.toString(),
                          style: new TextStyle(fontSize: 11.0)),
                      decoration: new BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    )),
              ],
            )),
        body: new Container(
            color: new Color.fromRGBO(255, 255, 255, 1.0),
            alignment: Alignment.center,
            child: dataLength > 0
                ? new Stack(
                    alignment: AlignmentDirectional.center,
                    children: data.map((item) {
                      if (data.indexOf(item) == dataLength - 1) {
                        return card(
                            item,
                            bottom.value,
                            right.value,
                            0.0,
                            backCardWidth + 10,
                            rotate.value,
                            rotate.value < -10 ? 0.1 : 0.0,
                            context,
                            dismissCardImage,
                            index,
                            addCardImage,
                            swipeRight,
                            swipeLeft);
                      } else {
                        backCardPosition = backCardPosition - 10;
                        backCardWidth = backCardWidth + 10;

                        return cardFake(item, backCardPosition, 0.0, 0.0,
                            backCardWidth, 0.0, 0.0, context);
                      }
                    }).toList())
                : new Center(
                    child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Center(
                          child: new Text("Plus d'Actus ",
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 50.0))),
                      new Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),
                      new FloatingActionButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        backgroundColor: Color.fromRGBO(52, 19, 139, 1.0),
                        child: new Icon(Icons.arrow_back_ios),
                      ),
                      new Text("Retour",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 25.0))
                    ],
                  )))));
  }
}
