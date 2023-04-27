import 'package:flutter/material.dart';
import '../pages/pages.dart';

class AppRoutes {

  static const String initialRoute = HomePage.route;

  static const String homePage = HomePage.route;
  static const String mapPage = MapPage.route;

  static final Map<String, Widget Function(BuildContext context)> routes = {
    homePage: (_) => const HomePage(),
    mapPage : (_) => const MapPage()
  };

}