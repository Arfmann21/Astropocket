import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/custom_icons/moon_icon_icons.dart';
import 'package:astropocket/style/custom_icons/rocket_icon_icons.dart';
import 'package:astropocket/ui/screens/launches/launches.dart';
import 'package:astropocket/ui/screens/mars_weather.dart';
import 'package:astropocket/ui/screens/moon_phases.dart';
import 'package:astropocket/ui/screens/nasa_reports.dart';
import 'package:astropocket/ui/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              top: getHeight(context) / 9.5,
              left: getWidth(context) / 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Card(
                    color: Color(0xFF333333),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) / 10.0),
                  child: Text(
                    'Missions',
                    style: GoogleFonts.poppins(
                        fontSize: 17.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) / 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Launches()));
                    },
                    child: Row(
                      children: [
                        Icon(RocketIcon.rocket_outline),
                        Padding(
                          padding:
                              EdgeInsets.only(left: getWidth(context) / 36.0),
                          child: Text(
                            'Launches',
                            style: GoogleFonts.poppins(
                                fontSize: 15.5, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) / 30.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NasaReports()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.insert_chart_outlined),
                        Padding(
                          padding:
                              EdgeInsets.only(left: getWidth(context) / 36.0),
                          child: Text(
                            'NASA Reports',
                            style: GoogleFonts.poppins(
                                fontSize: 15.5, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) / 10.0),
                  child: Text(
                    'Mars',
                    style: GoogleFonts.poppins(
                        fontSize: 17.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Column(
                  children: [
                    /*Row(
                      children: [
                        Icon(Icons.crop_original_outlined),
                        Padding(
                          padding:
                              EdgeInsets.only(left: getWidth(context) / 36.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MarsPhotosHome())),
                                                      child: Text(
                              'Mars Rover Photos',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 15.5),
                            ),
                          ),
                        ),
                      ],
                    ),*/
                    Padding(
                      padding: EdgeInsets.only(top: getWidth(context) / 15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MarsWeather()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.wb_sunny_outlined),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: getWidth(context) / 36.0),
                              child: Text(
                                'InSight Weather',
                                style: GoogleFonts.poppins(
                                    fontSize: 15.5, fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                 Padding(
                  padding: EdgeInsets.only(top: getWidth(context) / 10.0),
                  child: Text(
                    'Moon',
                    style: GoogleFonts.poppins(
                        fontSize: 17.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Column(
                  children: [
                    /*Row(
                      children: [
                        Icon(Icons.crop_original_outlined),
                        Padding(
                          padding:
                              EdgeInsets.only(left: getWidth(context) / 36.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MarsPhotosHome())),
                                                      child: Text(
                              'Mars Rover Photos',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 15.5),
                            ),
                          ),
                        ),
                      ],
                    ),*/
                    Padding(
                      padding: EdgeInsets.only(top: getWidth(context) / 15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MoonPhases()));
                        },
                        child: Row(
                          children: [
                            Icon(MoonIcon.moon),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: getWidth(context) / 36.0),
                              child: Text(
                                'Phases',
                                style: GoogleFonts.poppins(
                                    fontSize: 15.5, fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: getWidth(context) / 10.0),
                  child: Text(
                    'System',
                    style: GoogleFonts.poppins(
                        fontSize: 17.0, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                      padding: EdgeInsets.only(top: getWidth(context) / 15.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.settings_outlined),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: getWidth(context) / 36.0),
                              child: Text(
                                'Settings & info',
                                style: GoogleFonts.poppins(
                                    fontSize: 15.5, fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              ],
            ),
          ),
          
        ),
      ),
    );
  }
}
