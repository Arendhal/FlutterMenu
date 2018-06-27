import 'dart:math';
import 'dart:typed_data';
//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttermenu/flutter_staggered_grid_library.dart';
//import 'package:http/http.dart' as http;

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);

class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}

//Create random sizes value
List<IntSize> _createSizes(int count) {
  Random rnd = new Random();
  return new List.generate(count,
      (i) => new IntSize((rnd.nextInt(500) + 200), rnd.nextInt(800) + 200));
}

class ShopGrid extends StatelessWidget {
  ShopGrid() : _sizes = _createSizes(_kItemCount).toList();

  static const int _kItemCount = 85;
  final List<IntSize> _sizes;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new StaggeredGridView.countBuilder(
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemBuilder: (context, index) => new ArticleTile(index, _sizes[index]),
        staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  const ArticleTile(this.index, this.size);

  final IntSize size;
  final int index;
  static String url;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              //new Center(child: new CircularProgressIndicator()),
              new Center(
                child: new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'http://www2.saphir.re/wp-content/uploads/art0$index.png', 
                ),
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Column(
              children: <Widget>[
                /*new Text(
                  'Article: A afficher',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),*/
                new Text(
                  'Prix: XX €',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    new Center(
                    child:new Text('Disponibilité: ',
                    style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                      ),
                    ),
                    new Icon(Icons.check_circle_outline),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
