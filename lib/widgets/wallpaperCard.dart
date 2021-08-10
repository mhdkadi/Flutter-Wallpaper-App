import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_flutter/view/imagePage.dart';

Widget wallPaper(List<dynamic> listPhotos, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: StaggeredGridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 4,
      crossAxisSpacing: 6.0,
      mainAxisSpacing: 6.0,
      staggeredTiles: listPhotos.map((item) {
        return StaggeredTile.fit(2);
      }).toList(),
      children: listPhotos.map((item) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImagePage(
                  photo: item,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: RadialGradient(
                    center: Alignment.bottomRight,
                    radius: 0.5,
                    colors: [Color(0xfff5f8fd), Color(0xfff5f8fd)])),
            child: Column(
              children: [
                Container(
                  child: Hero(
                    tag: item["portrait"],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: item["portrait"],
                        placeholder: (context, url) => Container(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5, top: 5),
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Description",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Overpass',
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "${item["alt_description"]}",
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Overpass',
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "photographer",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Overpass',
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  "${item["photographer"]}",
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Overpass',
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
}
