import 'package:flutter/material.dart';

//Fragments
import 'package:fluttermenu/fragment_pages/fragment_pages.dart';

const String serviceFragmentRoute = '/fragment_pages/service_fragment/service_fragment';
const String shopFragmentRoute = '/fragment_pages/shop_fragment/shop_fragment';
const String networkFragmentRoute = 'fragment_pages/network_fragment/network_fragment';
const String subscribeFragmentRoute = 'fragment_pages/subscribe_fragment/subscribe_fragment';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{

serviceFragmentRoute: (BuildContext context) => new ServiceFragment(),
shopFragmentRoute: (BuildContext context) => new ShopFragment(),
networkFragmentRoute: (BuildContext context) => new NetworkFragment(),
subscribeFragmentRoute: (BuildContext context) => new SubscribeFragment(),

};
