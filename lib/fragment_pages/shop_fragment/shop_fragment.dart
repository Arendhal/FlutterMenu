import 'package:flutter/material.dart';
import 'staggered_grid.dart';

class ShopFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Magasins"),
        leading: new Container(
                margin: const EdgeInsets.all(1.0),
                child: new GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: new Icon(Icons.arrow_back_ios,
                        color: Colors.white, size: 30.0)))
      ),
      body: new Center(
        child: new ShopGrid(),
      ),
    );
  }
}
