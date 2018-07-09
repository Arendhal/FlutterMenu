
String articleText(int index) {
  String defaultText = "Texte article";
  String text;
  switch (index) {
    case 1:
      return text = article1();
      break;
    case 2:
      return text = article2();
      break;
    case 3:
      return text = article3();
      break;
    case 4:
      return text = article5();
      break;
    case 5:
      return text = article5();
      break;
    default:
      return defaultText;
  }
}

String article5() {
  String str = "La SAPHIR a organisé le 27 avril une cérémonie de remise de médailles du Travail.\n" +
      "30 membres du personnel, 8 femmes et 22 hommes, toutes catégories professionnelles confondues, ont ainsi été décorés à cette occasion.\n" +
      "- Médaille d'argent (20 ans de service) : 9 récipiendaires\n" +
      "- Médaille de vermeil (30 ans de service) : 8 récipiendaires\n" +
      "- Médaille d'or (35 ans de service) : 8 récipiendaires\n" +
      "- Médaille Grand or (40 ans de service) : 5 récipiendaires\n" +
      "Les médailles ont été remises par le Président Serge HOAREAU, le Directeur Général Philippe LORION et les membres du Conseil d’Administration." +
      "Le Président Serge HOAREAU a souligné lors de cet événement, l'engagement du personnel de l'entreprise dans les missions confiées.\n" +
      "Ce moment de grande convivialité, partagé avec les familles et les collègues, s'est achevé autour d'un rafraîchissement en l'honneur des nouveaux médaillés.";

  return str;
}
String article4() {
  String str =
      "La SAPHIR était présente à la 41ème Foire Agricole de BRAS-PANON qui s'est déroulée du 4 au 13 mai 2018. Cette participation a été menée en collaboration avec la Chambre d’Agriculture.\n" +
          "A cette occasion, un pilote d’irrigation à vocation pédagogique (du stockage d’eau à l’irrigation) a été mis en place sur une serre de démonstration.\n" +
          "Cette opération a une nouvelle fois permis à nos équipes présentes lors de cet événement, de rencontrer le monde agricole et de montrer tout notre savoir-faire sur des méthodes innovantes comme notamment le pilotage à distance de l’irrigation.";
  return str;
}
String article3() {
  String str = "Le Département de la Réunion Maître d'Ouvrage de l'opération et la SAPHIR, en charge de l'exploitation du réseau d'Irrigation du Littoral Ouest, procéderont prochainement à  des essais hydrauliques aux conditions limites, des ouvrages du transfert des Eaux d'Est en Ouest, en vue notamment de tester les installations et d'étalonner certains équipements de mesure.\n" +
      "Ces essais se dérouleront sur la période allant du mardi 26 juin au 06 juillet 2018." +
      "Durant cette période, des rejets d'eau interviendront :\n" +
      "- au niveau de l'ouvrage de restitution de l'eau en rivière des Galets située à  l'Ilet Savannah (Débit de rejet maximum de 4 m3/s),\n"
      "- au droit des ouvrages de rejet en rivière des Galets de la galerie Mafate situés respectivement au niveau du lieu-dit « Ilet Flamand » (PK 5,6) et en aval du lieu-dit « la Porte » (PK 7,8), à un débit maximum de 6,35 m3/s,\n" +
      "- au niveau de l'ouvrage de régulation du Bras de Sainte-Suzanne en aval de l'Ilet Natte, avec un débit maximum de 4,4 m3/s,\n" +
      "- dans la ravine Lolotte, à hauteur du radier du chemin Combavas\n" +
      "Les lâchers d'eau en rivière des Galets au niveau du déversoir du PK 7,8 (à  proximité immédiate du sentier d'accès menant aux îlets de Mafate) sont précédés de la mise en route d'une sirène et d'un gyrophare." +
      "Le déclenchement de l'avertisseur sonore permettant d'alerter les randonneurs, se fait 20 mn avant le rejet d'eau. \n" +
      "En conséquence, L'attention, ainsi qu'une vigilance accrue, est attendue de la part des usagers du lit de la rivière (randonneurs, touristes,...), vis-à -vis des variations ponctuelles du niveau d'eau de la rivière des Galets et du Bras de Sainte-Suzanne qui pourront subvenir durant la période des essais.\n";

  return str;
}
String article2() {
  String str =
      "Le magasin SAPHIR de Saint-Pierre est actuellement en travaux. Les clients pourront être accueillis dans un nouveau cadre dès fin juin";
  return str;
}
String article1() {
  String str = "Après un peu plus d'un an d'exploitation du périmètre Ouest, la Direction de la SAPHIR a souhaité organiser pour son personnel, une visite du site de Mon Repos.\n" +
      "L'ensemble des collaborateurs était convié à la découverte de ce magnifique cadre de travail qui s'est déroulée, il faut le préciser, en dehors du temps de travail.\n" +
      "Les participants ont ainsi pu découvrir l'arrivée de la galerie de Mafate, les réservoirs de 25000 m3, la station de filtration située à l'amont du départ en distribution, une station de pompage (STC1) ainsi que le centre de supervision du périmètre ILO.\n" +
      "Cette occasion a également été mise à profit pour faire une photo de 'famille' avec la quasi totalité du personnel.\n";
  return str;
}

String articleTitle(int index){
  String str;
  switch(index){
    case 1:
      return str="VISITE DE MON REPOS";
      break;
    case 2:
      return str= "TRAVAUX";
      break;
    case 3: 
      return str= "ESSAIS HYDRAULIQUES";
      break;
    case 4:
      return str= "FOIRE AGRICOLE";
      break;
    case 5: 
      return str= "MEDAILLES DU TRAVAIL";
      break;
  }
  return str;
}