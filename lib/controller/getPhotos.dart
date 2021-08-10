import 'package:wallpaper_flutter/model/services.dart';

class GetPhotos {
  //TODO: PUT YOUR UNSPLASH APIKEY
  String apiKEY = 'PUT YOUR UNSPLASH APIKEY ';
  ApiServices _apiServices = ApiServices();
  Future getTrendingPhotos(int page) async {
    List photos = [];
    dynamic response = await _apiServices.getTrendingPhotos(page, apiKEY);
    if (response != null) {
      response.forEach((element) {
        photos.add({
          "photographer": element["user"]["name"].toString().contains('null')
              ? 'Unknown Photographer'
              : element["user"]["name"],
          "portrait": element["urls"]["small"],
          "created_at": element["created_at"],
          "alt_description":
              element["alt_description"].toString().contains('null')
                  ? 'No Description'
                  : element["alt_description"],
          "likes": element["likes"],
        });
      });
      return photos;
    } else {
      return null;
    }
  }

  Future getSearchPhotos(int page, String categorie) async {
    List photos = [];
    dynamic response =
        await _apiServices.getSearchPhotos(page, apiKEY, categorie);
    if (response != null) {
      response.forEach((element) {
        photos.add({
          "photographer": element["user"]["name"].toString().contains('null')
              ? 'Unknown Photographer'
              : element["user"]["name"],
          "portrait": element["urls"]["small"],
          "created_at": element["created_at"],
          "alt_description":
              element["alt_description"].toString().contains('null')
                  ? 'No Description'
                  : element["alt_description"],
          "likes": element["likes"],
        });
      });
      return photos;
    } else {
      return null;
    }
  }
}
