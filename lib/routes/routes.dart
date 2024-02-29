import 'package:flutter/material.dart';
import 'package:memory_usage/pages/add_page.dart';
import 'package:memory_usage/pages/home_page.dart';

class RoutesPage {
  Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const HomePage());

      case '/add':
        return MaterialPageRoute(builder: (context) => const AddPage());

      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
