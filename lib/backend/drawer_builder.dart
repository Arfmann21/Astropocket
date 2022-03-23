import 'package:astropocket/style/custom_icons/iss_icon_icons.dart';
import 'package:astropocket/style/custom_icons/moon_icon_icons.dart';
import 'package:astropocket/style/custom_icons/planet_icon_icons.dart';
import 'package:astropocket/style/custom_icons/rocket_icon_icons.dart';
import 'package:astropocket/ui/screens/iss/issmain.dart';
import 'package:astropocket/ui/screens/mars_weather.dart';
import 'package:astropocket/ui/screens/moon_phases.dart';
import 'package:astropocket/ui/screens/nasa_reports.dart';
import 'package:astropocket/ui/screens/planets_home.dart';
import 'package:astropocket/ui/screens/settings.dart';
import 'package:flutter/material.dart';

import '../ui/screens/launches/launches.dart';

class DrawerBuilder {

  List<String> sectionTitles = ['Missions', 'Solar System', 'System'];

  List<List<String>> sectionNames = [
    ['Launches', 'NASA Reports', 'ISS Tracker'],
    ['InSight Weather', 'Moon Phases', 'Planets'],
    ['Settings & info']
  ];

  List<List<IconData>> iconsList = [
    [RocketIcon.rocket_outline, Icons.insert_chart_outlined, IssIcon.satellite],
    [Icons.wb_sunny_outlined, MoonIcon.moon, PlanetIcon.planet_svgrepo_com],
    [Icons.settings_outlined]
  ];

  List<List<Widget>> routes = [
    [Launches(), NasaReports(), IssMain()],
    [
      MarsWeather(),
      MoonPhases(),
      PlanetsHome(
      )
    ],
    [Settings()]
  ];

  void goToRoute(context, mainIndex, secondaryIndex) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => routes[mainIndex][secondaryIndex]));
  }
}
