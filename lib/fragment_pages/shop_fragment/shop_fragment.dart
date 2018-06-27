import 'package:flutter/material.dart';
import 'staggered_grid.dart';

class ShopFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Magasins"),
      ),
      body: new Center(
        child: new ShopGrid(),
      ),
    );
  }
}
