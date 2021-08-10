import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices {
  Future getTrendingPhotos(int page, String apiKEY) async {
    dynamic response;
    try {
      await http
          .get(Uri.parse(
              "https://api.unsplash.com/photos/?client_id=$apiKEY&per_page=30&page=$page"))
          .then((value) {
        response = jsonDecode(value.body);
      });
      return response;
    } catch (error) {
      print("Error Getting Trending Photos: ($error)");
      return null;
    }
  }

  Future getSearchPhotos<List>(
      int page, String apiKEY, String categorie) async {
    dynamic response;
    try {
      await http
          .get(Uri.parse(
              "https://api.unsplash.com/search/photos/?client_id=$apiKEY&query=$categorie&per_page=30&page=$page"))
          .then((value) {
        response = jsonDecode(value.body)["results"];
      });
      return response;
    } catch (error) {
      print("Error Getting Searching Photos: ($error)");
      return null;
    }
  }
}
