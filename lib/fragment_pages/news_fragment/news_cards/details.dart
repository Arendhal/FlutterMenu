import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'data.dart';
import 'details_text.dart';
import 'card_animation.dart';


enum AppbarBehavior { normal, pinned, floating, snapping }

class DetailPage extends StatefulWidget {
  final DecorationImage decorationImage;
  const DetailPage({Key key, this.decorationImage}) : super(key: key);

  @override
  DetailPageState createState() =>
      new DetailPageState(decorationImage: decorationImage);
}

class DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  AnimationController animationController;
  
  DecorationImage decorationImage;
  DetailPageState({this.decorationImage});

  List data = imageData;
  AppbarBehavior appbarBehavior = AppbarBehavior.pinned;

  num appbarHeight = 256.0;

  void initState() {
    animationController = new AnimationController(
        duration: new Duration(milliseconds: 2000), vsync: this);
    super.initState();

    height = new Tween<double>(
      begin: 400.0,
      end: 400.0,
    ).animate(new CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    ));
    height.addListener(() {
      setState(() {
        if (height.isCompleted) {
          //print("Height.isCompleted");
        }
      });
    });

    width = new Tween<double>(
      begin: 200.0,
      end: 220.0,
    ).animate(new CurvedAnimation(
      parent: animationController,
      curve: Curves.ease,
    ));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  String returnString(){
    String str = "Dans le cadre de la démarche SMI menée par la SAPHIR, le dernier audit de suivi (ou de surveillance), s'est déroulé du 25 avril au 28 avril 2017 et a été mené par un auditeur de l’AFNOR (Michel PETIT).\n\n"+" Au programme de cette semaine d’audit, la visite du Captage du Bras de la Plaine, des forages de Delbon, de la station de pompage de Larrey etc…\n"+ 
    "Ces visites de terrains ont été complétées par les audits des processus R0 (Gestion administrative et Commerciale des abonnés), R3 (Maintenance des ouvrages), R5 (Négoce/ Vente au comptoir), R6 (Équipements d’Irrigation), S2 (Gestion du Système Informatique)…\n"+
    "Le défi de cette année 2017, concernant le maintien de nos 4 certificats (Qualité, Sécurité, Environnement et Énergie), a été relevé avec succès.\n"+
    "L'ensemble du personnel a pleinement contribué à cette belle réussite et particulièrement à Julie BARDEUR (RQSE) et Nicolas CERVEAU (RÉ).\n"+
    "Le prochain audit de renouvellement 2018 doit d'ores et déjà être préparé avec comme challenge l'intégration de nos nouvelles zones d’activités.\n"+
    "Pour relever ce défis, la SAPHIR peut compter sur l’ensemble des pilotes et de ses collaborateurs pour faire de cet objectif d’intégration de nos nouveaux périmètres, une priorité ….";
  return str;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.85;
    int image = data.indexOf(decorationImage);
    int index = imageData.length;
   
    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        platform: Theme.of(context).platform,
      ),
      child: new Container(
        width: width.value,
        height: height.value,
        color: Color.fromRGBO(255,255,255, 1.0),
        child: new Hero(
          tag: "image",
          child: new Card(
            color: Colors.transparent,
            child: new Container(
              alignment: Alignment.center,
              width: width.value,
              height: height.value,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(8.0),
              ),
              child: new Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  new CustomScrollView(
                    shrinkWrap: false,
                    slivers: <Widget>[
                      new SliverAppBar(
                        elevation: 0.0,
                        forceElevated: true,
                        leading: new IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: new Icon(
                            Icons.arrow_back_ios,
                            color: Color.fromRGBO(52,39,119,1.0),
                            size: 25.0,
                          ),
                        ),
                        expandedHeight: appbarHeight,
                        pinned: appbarBehavior == AppbarBehavior.pinned,
                        floating: appbarBehavior == AppbarBehavior.floating ||
                            appbarBehavior == AppbarBehavior.snapping,
                        snap: appbarBehavior == AppbarBehavior.snapping,
                        flexibleSpace: new FlexibleSpaceBar(
                            title: new Text(articleTitle(index), style:new TextStyle(fontSize: 15.0)), // Set Title
                            background: new Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                new Container(
                                  width: width.value,
                                  height: height.value,
                                  decoration: new BoxDecoration(
                                    image: data[image],
                                  ),
                                )
                              ],
                            )),
                      ),
                      new SliverList(
                        delegate: new SliverChildListDelegate(
                          <Widget>[
                            new Container(
                              color: Colors.white,
                              child: new Padding(
                                  padding: EdgeInsets.all(30.0),
                                  child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new Container(
                                          padding:
                                              new EdgeInsets.only(bottom: 25.0),
                                          alignment: Alignment.center,
                                          decoration: new BoxDecoration(
                                              color: Colors.white,
                                              border: new Border(
                                                  bottom: new BorderSide(
                                                      color: Colors.black38))),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              new Row(
                                                children: <Widget>[
                                                  new Icon(
                                                    Icons.date_range,
                                                    color: Colors.cyan,
                                                  ),
                                                  new Padding(
                                                    padding:
                                                        EdgeInsets.all(6.0),
                                                    child: new Text("DATE"), //TODO Set date
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        new Padding(
                                          padding: EdgeInsets.only(
                                              top: 16.0, bottom: 6.0,),
                                          child: new Text(
                                            articleTitle(index),
                                            style: new TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25.0),
                                          ),
                                        ),
                                        new Text(articleText(index)), //Set article text
                                        new Container(
                                          margin:
                                              new EdgeInsets.only(top: 20.0),
                                          padding: new EdgeInsets.only(
                                              top: 5.0, bottom: 10.0),
                                          height: 115.0,
                                          decoration: new BoxDecoration(
                                              color: Colors.white,
                                              border: new Border(
                                                  top: new BorderSide(
                                                      color: Colors.blueGrey))),
                                          child: new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              new Text(
                                                "Some text",
                                                style: new TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              new Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  new CircleAvatar(
                                                    backgroundImage: avatar1,
                                                  ),
                                                  new CircleAvatar(
                                                    backgroundImage: avatar2,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        new Container(
                                          height: 110.0,
                                        )
                                      ])),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    width: 550.0,
                    height: 75.0,
                    decoration: new BoxDecoration(
                        color: Color.fromRGBO(255,255,255, 1.0)),
                    alignment: Alignment.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
