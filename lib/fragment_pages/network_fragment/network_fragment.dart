import 'package:flutter/material.dart';
//import 'package:google_maps_webservice/places.dart' as places;
import 'package:map_view/map_options.dart';
import 'package:map_view/map_view.dart';
import 'dart:async';


var apikey = "AIzaSyA4Z8pUR_fo7awWg6AONZe8HbHNzWo4K5w";

class NetworkFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new MapPage(),
    );
  }
}

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);

  @override
  MapPageState createState() => new MapPageState();
}

class MapPageState extends State<MapPage> {
  MapView mapView = new MapView();

  List<Marker> markerList = [
    new Marker("SAPHIR SPierre", "SAPHIR Saint Pierre", -21.321501, 55.486264),
    new Marker("SAPHIR SPaul", "SAPHIR Saint Paul", -20.961807, 55.662105),
    new Marker("Saphir Villèle", "Saphir Villèle", -21.057859, 55.260330),
  ];

  void _setapikey() {
    MapView.setApiKey(apikey);
  }

  void _addMarker() {
    int i = 0;
    for (i = 0; i < markerList.length; i++) {
      mapView.addMarker(markerList[i]);
    }
  }

  Future _showMap() async {
    //Always set key before using map
    _setapikey();

    //Setting the map
    mapView.show(
        new MapOptions(
            showUserLocation: true,
            title: "Carte Réseau de la SAPHIR",
            initialCameraPosition:
                new CameraPosition(new Location(-21.085733, 55.519153), 9.5)),
        toolbarActions: <ToolbarAction>[new ToolbarAction("Fermer", 1)]);

    //Adding map's markers
    mapView.onMapReady.listen((_) => _addMarker());

    //Used to close the map
    mapView.onToolbarAction.listen((id) {
      if (id == 1) {
        mapView.dismiss();
      }
    });
  }

  TextStyle classicStyle() {
    return new TextStyle(fontSize: 16.0, color: Colors.black, wordSpacing: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(" Réseau de la SAPHIR"),
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
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Consultez notre carte!\n\n", style: classicStyle()),
          new FloatingActionButton(
            onPressed: _showMap,
            tooltip: "Show Map",
            child: new Icon(Icons.map),
          ),
        ],
      )),
    );
  }
}
