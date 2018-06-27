class ServiceItem {
  ServiceItem({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final sampleItems = <ServiceItem>[
  new ServiceItem(
    title: 'Venez découvrir nos derniers articles!',
    category: 'MAGASINS',
    imageUrl: 'assets/pages/service_page1.jpg',
  ),
  new ServiceItem(
    title: "Abonnez vous au réseau d'eau de la SAPHIR.",
    category: 'ABONNEMENT',
    imageUrl: 'assets/pages/service_page2.jpg',
  ),
  new ServiceItem(
    title: "Restez informés de l'état de notre réseau tout moment.",
    category: 'RESEAU',
    imageUrl: 'assets/pages/service_page3.jpg',
  ),
];
