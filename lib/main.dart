import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/consts/string.dart';
import 'package:wallpaper_flutter/controller/routesGeneratere.dart';

void main() {
  runApp(WallPaperFlutter());
}

class WallPaperFlutter extends StatelessWidget {
  const WallPaperFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      initialRoute: '\HomePage',
      onGenerateRoute: Routes.routesGenerater,
    );
  }
}
