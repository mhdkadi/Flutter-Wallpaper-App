import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/controller/getPhotos.dart';
import 'package:wallpaper_flutter/widgets/appBar.dart';
import 'package:wallpaper_flutter/widgets/wallpaperCard.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.searchText}) : super(key: key);
  final String searchText;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List photos = [];
  int page = 1;
  TextEditingController searchController = new TextEditingController();
  ScrollController _scrollController = new ScrollController();
  GetPhotos _getPhotos = GetPhotos();

  @override
  void initState() {
    searchController.text = widget.searchText;
    _getPhotos.getSearchPhotos(page, searchController.text).then((value) {
      setState(() {
        photos = value;
      });
    });
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page++;
        _getPhotos.getSearchPhotos(page, searchController.text).then((value) {
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
      appBar: appBar,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            hintText: "search wallpapers",
                            border: InputBorder.none),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _getPhotos
                            .getSearchPhotos(page, searchController.text)
                            .then((value) {
                          setState(() {
                            photos = value;
                          });
                        });
                      },
                      child: Container(
                        child: Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
                //TODO inputFild
              ),
              SizedBox(
                height: 30,
              ),
              wallPaper(photos, context),
            ],
          ),
        ),
      ),
    );
  }
}
