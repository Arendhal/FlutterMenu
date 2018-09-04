import 'package:flutter/material.dart';

DecorationImage image1 = new DecorationImage(
  image: new AssetImage('assets/pages/news_page/news_page1.png'),
  fit: BoxFit.cover,
);
DecorationImage image2 = new DecorationImage(
  image: new AssetImage('assets/pages/news_page/news_page2.png'),
  fit: BoxFit.cover,
);

DecorationImage image3 = new DecorationImage(
  image: new AssetImage('assets/pages/news_page/news_page3.png'),
  fit: BoxFit.cover,
);
DecorationImage image4 = new DecorationImage(
  image: new AssetImage('assets/pages/news_page/news_page4.png'),
  fit: BoxFit.cover,
);
DecorationImage image5 = new DecorationImage(
  image: new AssetImage('assets/pages/news_page/news_page5.png'),
  fit: BoxFit.cover,
);

ImageProvider avatar1 =
    new AssetImage('assets/pages/news_page/avatar/avatar-1.jpg');
ImageProvider avatar2 =
    new AssetImage('assets/pages/news_page/avatar/avatar-2.jpg');

List imageData = [image1, image3, image4, image2, image5]; //pictures must be in reverse order to correspond with the text

