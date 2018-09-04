import 'package:flutter/material.dart';
import 'package:flutter_radial_menu/flutter_radial_menu.dart';
import 'package:url_launcher/url_launcher.dart';

enum MenuOptions{
  agenceSud,
  agenceOuest,
  agenceEst,
  serviceIrrigation,
  astreinteFirst,
  astreinteSecond,
}

final List<RadialMenuItem<MenuOptions>> items = <RadialMenuItem<MenuOptions>>[
    new RadialMenuItem<MenuOptions>(
      value: MenuOptions.agenceSud,
      child: new FloatingActionButton(
            heroTag: "agenceSud",
            onPressed: () => (){
            launch("tel://0262961920");
            },
            child : new Icon(Icons.call),
            backgroundColor: Colors.blue[400],
          ),
      iconColor: Colors.white,
       tooltip: "Contactez notre Agence Sud",
    ),
   
    new RadialMenuItem<MenuOptions>(
      value: MenuOptions.agenceOuest,
      child:new FloatingActionButton(
         heroTag: "agenceOuest",
        onPressed: () => (){
            launch("tel://0262719644");
        },
        child: new Icon(Icons.call),
        backgroundColor: Colors.green[400],
      ),
      iconColor: Colors.white,
       tooltip: "Contactez notre Agence Ouest",
    ),
   
   new RadialMenuItem<MenuOptions>(
      value: MenuOptions.agenceEst,
      child:new FloatingActionButton(
        heroTag: "agenceEst",
        onPressed:() => (){
            launch("tel://0262976916");
        },
        child: new Icon(Icons.call),
        backgroundColor: Colors.red[400],
      ),
      iconColor: Colors.white,
      tooltip: "Contactez notre Agence Est",
    ),
    
    new RadialMenuItem<MenuOptions>(
      value: MenuOptions.serviceIrrigation,
      child:new FloatingActionButton(
        heroTag: "serviceIrrigation",
        onPressed: () => (){
            launch("tel://0262961928");
        },
        child: new Icon(Icons.call),
        backgroundColor: Colors.orange[400],
      ),
      iconColor: Colors.white,
      tooltip: "Contactez le service Irrigation",
    ),
    
    new RadialMenuItem<MenuOptions>(
      value: MenuOptions.astreinteFirst,
      child:new FloatingActionButton(
        heroTag: "astreinteFirst",
        onPressed: () => (){
           launch("tel://0692862333");
        },
        child: new Icon(Icons.call),
        backgroundColor: Colors.purple[400],
      ),
      iconColor: Colors.white,
      tooltip: "Contactez notre service d'astreinte",
    ),
];
