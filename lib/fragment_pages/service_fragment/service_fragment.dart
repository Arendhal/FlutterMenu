import 'package:flutter/material.dart';
import 'package:fluttermenu/fragment_pages/service_fragment/page_transform/service_page_view.dart';

class ServiceFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Services"),
      ),
      body: new Center(
        child: ServicePageView(),
      ),
    );
  }
}
