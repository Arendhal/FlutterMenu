import 'package:flutter/material.dart';

//Fragments
import 'package:fluttermenu/fragment_pages/fragment_pages.dart';

const String home = '/fragment_pages/service_fragment/service_fragment';
const String shopFragmentRoute = '/fragment_pages/shop_fragment/shop_fragment';
const String networkFragmentRoute = 'fragment_pages/network_fragment/network_fragment';
const String subscribeFragmentRoute = 'fragment_pages/subscribe_fragment/subscribe_fragment';
const String newsFragmentRoute = 'fragment_pages/news_fragment/news_fragment';
const String contactFragmentRoute = 'fragment_pages/contact_fragment/contact_fragment';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{

home: (BuildContext context) => new ServiceFragment(),
shopFragmentRoute: (BuildContext context) => new ShopFragment(),
networkFragmentRoute: (BuildContext context) => new NetworkFragment(),
subscribeFragmentRoute: (BuildContext context) => new SubscribeFragment(),
newsFragmentRoute: (BuildContext context) => new NewsFragment(),
contactFragmentRoute: (BuildContext context) => new ContactFragment(),

};
