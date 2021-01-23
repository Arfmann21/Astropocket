library config.globals;

import 'package:astropocket/backend/api/launches_api.dart';
import 'package:astropocket/backend/check_loading.dart';
import 'package:astropocket/backend/theme_changer.dart';
import 'package:astropocket/ui/widgets/itself/news/articles_news.dart';
import 'package:astropocket/ui/widgets/itself/news/blogs_news.dart';
import 'package:flutter/cupertino.dart';

import 'api/nasa_apod.dart';

ThemeChanger themeChanger = ThemeChanger();
CheckLoading checkLoading = CheckLoading();

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

ApodApi apodObject = ApodApi();
LaunchesApi launchesObject = LaunchesApi();

List newsPages = [
  ArticlesNews(),
  BlogsNews()
];

String youtubeThumbnail = "";
// Planets
List<String> planetsName = [
  'Mercury',
  'Venus',
  'Earth',
  'Mars',
  'Jupiter',
  'Saturn',
  'Uranus',
  'Neptune'
];

List<String> planetsSubtitle = [
  'The smallest',
  'Earth\'s twin',
  'Home',
  'The red planet',
  'The giant',
  'Glorious rings',
  'Sideways planet',
  'Faint rings'
];
