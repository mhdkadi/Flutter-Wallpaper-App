import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/view/categoriesPage.dart';
import 'package:wallpaper_flutter/view/homePage.dart';
import 'package:wallpaper_flutter/view/imagePage.dart';
import 'package:wallpaper_flutter/view/searchPage.dart';

class Routes {
  static Route<dynamic> routesGenerater(RouteSettings siettings) {
    final dynamic argument = siettings.arguments;
    switch (siettings.name) {
      case '\HomePage':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '\SearchPage':
        return MaterialPageRoute(
            builder: (context) => SearchPage(searchText: argument));
      case '\ImagePage':
        return MaterialPageRoute(
            builder: (context) => ImagePage(photo: argument));
      case '\CategoriePage':
        return MaterialPageRoute(
            builder: (context) => CategoriePage(categorie: argument));
      default:
        return MaterialPageRoute(builder: (context) => HomePage()); //TODO
    }
  }
}
