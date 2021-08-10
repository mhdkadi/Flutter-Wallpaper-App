import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/controller/getPhotos.dart';
import 'package:wallpaper_flutter/widgets/appBar.dart';
import 'package:wallpaper_flutter/widgets/wallpaperCard.dart';

class CategoriePage extends StatefulWidget {
  final String categorie;

  CategoriePage({required this.categorie});

  @override
  _CategoriePageState createState() => _CategoriePageState();
}

class _CategoriePageState extends State<CategoriePage> {
  List photos = [];

  int page = 1;
  ScrollController _scrollController = new ScrollController();
  GetPhotos _getPhotos = GetPhotos();

  @override
  void initState() {
    _getPhotos.getSearchPhotos(page, widget.categorie).then((value) {
      setState(() {
        photos = value;
      });
    });
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page++;
        _getPhotos.getSearchPhotos(page, widget.categorie).then((value) {
          setState(() {
            photos.addAll(value);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: wallPaper(photos, context),
      ),
    );
  }
}
