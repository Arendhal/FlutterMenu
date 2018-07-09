import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'data.dart';
import 'package:fluttermenu/routes.dart';
import 'package:fluttermenu/fragment_pages/subscribe_fragment/subscribe_fragment.dart';
import 'page_transformer.dart';

class ServicePageItem extends StatelessWidget {
  ServicePageItem({
    @required this.item,
    @required this.pageVisibility,
  });

  final ServiceItem item;
  final PageVisibility pageVisibility;
  static int index = 0;

  String _getCategory() {
    return '${item.category}';
  }

  void _navigate(String category, BuildContext context) {
    switch (category) {
      case "MAGASINS":
        Navigator.of(context).pushNamed(shopFragmentRoute);
        break;
      case "ABONNEMENT":
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new SubscribeFragment()));
        //Navigator.of(context).pushNamed(subscribeFragmentRoute);
        break;
      case "RESEAU":
        Navigator.of(context).pushNamed(networkFragmentRoute);
        break;
      case "ACTUALITES":
        Navigator.of(context).pushNamed(newsFragmentRoute);
        break;
      default:
        Navigator.of(context).pushNamed(home);
    }
  }

  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation = pageVisibility.pagePosition * translationFactor;

    return new Opacity(
      opacity: pageVisibility.visibleFraction,
      child: new Transform(
        alignment: FractionalOffset.topLeft,
        transform: new Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }

  _buildTextContainer(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final categoryText = _applyTextEffects(
      translationFactor: 300.0,
      child: new Text(
        "\n\n" + item.category,
        style: textTheme.caption.copyWith(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          fontSize: 14.0,
        ),
        textAlign: TextAlign.center,
      ),
    );

    final titleText = _applyTextEffects(
      translationFactor: 200.0,
      child: new Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: new Text(
          item.title,
          style: textTheme.title
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return new Positioned(
      bottom: 56.0,
      left: 32.0,
      right: 32.0,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'Tag:${item.category}',
            onPressed: () {
              _navigate(_getCategory(), context);
            },
            child: Icon(Icons.arrow_forward_ios),
          ),
          categoryText,
          titleText,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = new Image.asset(
      item.imageUrl,
      fit: BoxFit.cover,
      alignment: new FractionalOffset(
        0.5 + (pageVisibility.pagePosition / 3),
        0.5,
      ),
    );

    final imageOverlayGradient = new DecoratedBox(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            const Color(0xFF000000),
            const Color(0x00000000),
          ],
        ),
      ),
    );

    return new Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      child: new Material(
        elevation: 4.0,
        borderRadius: new BorderRadius.circular(8.0),
        child: new Stack(
          fit: StackFit.expand,
          children: [
            image,
            imageOverlayGradient,
            _buildTextContainer(context),
          ],
        ),
      ),
    );
  }
}
