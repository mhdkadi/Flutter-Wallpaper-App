# wallpaper-flutter

 - Simple wallpaper flutter Application(still under development)

 - Flutter + Method channel (Kotlin/Swift)

## Getting Started

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view 
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Trying apk
[Donwload apk here](app-release.apk)

# Develop

Make sure finish [install Flutter](https://flutter.io/get-started/install/) successfully

1. Clone this repo by: `git clone https://github.com/mhdkadi/Flutter-Wallpaper-App.git`
2. Install all the packages by: `flutter packages get`
3. PUT YOUR UNSPLASH APIKEY in `lib\controller\getPhsotos.dart` file
4. Run app on your simulator by: `flutter run`

## Packages in using
* flutter_staggered_grid_view: ^0.4.0
* http: ^0.13.3

## What's been done?

- [x] Fetch wallpapers from Unsplash site using its API.
- [x] Refresh and load more wallpaper when scroll to bottom of screen.
- [x] Search using keywords.
- [x] The app built whit MVC design pattern.
- [x] List of categories.

## What's left?
- Download wallpapers.
- Set Image as Wallpaper.
- Make wallpapers fit the device screen.
- Make the app responsive according to various screen sizes.
- Implement routs to pages.
- Implement stat management using provider.


*If you would like to contribute , feel free and open a pull request.*