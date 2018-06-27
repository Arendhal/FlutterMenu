import 'package:fluttermenu/fragment_pages/service_fragment/service_fragment.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'NavigationDrawer Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ServiceFragment(),
      routes: routes,
    );
  }
}
