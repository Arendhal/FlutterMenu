import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'carousel_slider.dart';
import 'package:flutter/material.dart';
import 'data.dart';

Future<Null> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: false, forceWebView: false);
  } else {
    throw 'Could not launch $url';
  }
}

CarouselSlider carousel = new CarouselSlider(
  items: imgAsset.map((url) {
    return new Container(
      margin: new EdgeInsets.symmetric(horizontal: 5.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
        image: new DecorationImage(
          image: new AssetImage(url),
          fit: BoxFit.cover,
        ),
        color: Colors.deepPurple,
      ),
    );
  }).toList(),
  viewportFraction: 0.9,
  aspectRatio: 2.0,
);

nextSlider() {
  carousel.nextPage(
      duration: new Duration(milliseconds: 1000), curve: Curves.linear);
}

//Move to prev slider
prevSlider() {
  carousel.previousPage(
      duration: new Duration(milliseconds: 1000), curve: Curves.easeIn);
}

TextStyle linkStyle() {
  return new TextStyle(
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
      fontSize: 16.0,
      color: Colors.blue,
      wordSpacing: 3.0);
}
TextStyle classicStyle() {
  return new TextStyle(fontSize: 16.0, color: Colors.black, wordSpacing: 3.0);
}

//Switch TextStyle according to slide
TextStyle _switchStyle(int index) {
  switch (index) {
    case 0:
      return classicStyle();
      break;
    default:
      return linkStyle();
      break;
  }
}

//Switch URLs according to slide
String _switchUrl(int index) {
  String url = "";
  switch (index) {
    case 1:
      return url =
      "http://www.saphir.re/wp-content/uploads/ANNEXE-9-Annexe-R%C3%A8g-Serv-SUD.pdf";
      break;
    case 2:
      return url =
      "http://www.saphir.re/wp-content/uploads/ANNEXE-11-SUD-_TARIFICATION-EAU-ET-PRESTATIONS-ANNEXES.pdf";
      break;
    case 3:
      return url =
      "http://www.saphir.re/wp-content/uploads/ANNEXE-11-OUEST-_TARIFICATION-EAU-ET-PRESTATIONS-ANNEXES-modif-F2.pdf";
      break;
    default:
      return url;
      break;
  }
}

Widget _mycarousel = new ListView(
  children: <Widget>[
    new Padding(
      padding: new EdgeInsets.symmetric(vertical: 15.0),
      child: carousel,
    ),
    new Row(
      children: <Widget>[
        new Expanded(
          child: new RaisedButton(
              onPressed: prevSlider, child: new Text('Précedent')),
        ),
        new Expanded(
            child: new RaisedButton(
                onPressed: nextSlider, child: new Text('Suivant')))
      ],
    ),
    new Padding(
      padding: new EdgeInsets.symmetric(vertical: 15.0),
      child: new CarouselSlider(
        items: [ 0, 1,2,3 ].map((i) {
          return new Builder(
            builder: (BuildContext context) {
              return new Container(
                width: MediaQuery.of(context).size.width,
                margin: new EdgeInsets.symmetric(horizontal: 5.0),
                decoration: new BoxDecoration(
                    color: Colors.transparent ),
                child: new RichText(
                  text: new TextSpan(
                    children: [
                      new TextSpan(
                        text: text[i],
                        style: _switchStyle(i),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            //print("Handle onTap");
                            _launchInBrowser(_switchUrl(i));
                          },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }).toList(),
        height: 400.0,
        autoPlay: true,
      ),
    ),
  ],
);

Widget returnCarousel(){
  return _mycarousel;
}