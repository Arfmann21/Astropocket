library config.globals;

import 'package:astropocket/backend/api/launches_api.dart';
import 'package:astropocket/backend/check_loading.dart';
import 'package:astropocket/backend/drawer_state.dart';
import 'package:astropocket/backend/theme_changer.dart';
import 'package:astropocket/ui/widgets/itself/news/articles_news.dart';
import 'package:astropocket/ui/widgets/itself/news/blogs_news.dart';
import 'package:astropocket/ui/widgets/launches/previous_launches_list.dart';
import 'package:astropocket/ui/widgets/launches/upcoming_launches_list.dart';
import 'package:flutter/cupertino.dart';

import 'api/nasa_apod.dart';

ThemeChanger themeChanger = ThemeChanger();
DrawerState drawerState = DrawerState();
CheckLoading checkLoading = CheckLoading();

var fetchNasaReports;
var fetchedUpcomingLaunches;
var fetchedPreviousLaunches;

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

ApodApi apodObject = ApodApi();
LaunchesApi launchesObject = LaunchesApi();

List newsPages = [ArticlesNews(), BlogsNews()];

List launchesPages = [
  UpcomingLaunchesList(
    type: 'upcoming',
  ),
  PreviousLaunchesList(),
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
