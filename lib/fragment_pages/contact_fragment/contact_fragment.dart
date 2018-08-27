import 'package:flutter/material.dart';
import 'package:flutter_radial_menu/flutter_radial_menu.dart';
import 'data.dart';

class ContactFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
         title: new Text("Contactez-Nous!"),
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
        child: new RadialMenu(
          items: items,
          radius: 100.0,
          onSelected: _onItemSelected
        ),
      )
    );
  }
}

void _onItemSelected(MenuOptions value) {
    print(value);
  }