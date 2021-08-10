import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/consts/string.dart';
import 'package:wallpaper_flutter/controller/getPhotos.dart';
import 'package:wallpaper_flutter/view/searchPage.dart';
import 'package:wallpaper_flutter/widgets/appBar.dart';
import 'package:wallpaper_flutter/widgets/categoriesWidget.dart';
import 'package:wallpaper_flutter/widgets/wallpaperCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = new TextEditingController();
  ScrollController _scrollController = new ScrollController();
  GetPhotos _getPhotos = GetPhotos();
  int page = 1;
  List photos = [];
  @override
  void initState() {
    _getPhotos.getTrendingPhotos(page).then((value) {
      setState(() {
        photos = value;
      });
    });
    _scrollController.addListener(() {
      print(_scrollController.position.pixels);
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page++;
        _getPhotos.getTrendingPhotos(page).then((value) {
          setState(() {
            photos.addAll(value);
          });
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(30),
              ),
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: searchText,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (_searchController.text.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchPage(
                              searchText: _searchController.text,
                            ),
                          ),
                        );
                      } else {
                        //TODO
                      }
                    },
                    child: Container(
                      child: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 80,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: getCategories.length,
                itemBuilder: (context, index) {
                  return CategorieWidget(categorie: getCategories[index]);
                },
              ),
            ),
            Text(
              "Discover new photos",
              style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Overpass',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 14,
            ),
            wallPaper(photos, context),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
