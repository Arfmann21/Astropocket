import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/themes.dart';
import 'package:astropocket/ui/screens/home.dart';
import 'package:astropocket/ui/widgets/changelog/fixes.dart';
import 'package:astropocket/ui/widgets/changelog/new_features.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Changelog extends StatelessWidget {
  final versionNumber;

  Changelog({this.versionNumber});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AstroPocket',
        themeMode: themeChanger.currentTheme(),
        theme: lightTheme(),
        darkTheme: darkTheme(),
        home: Scaffold(
          appBar: AppBar(
            title: Material(
              color: Colors.transparent,
              child: Text(
                'What\'s new',
                style: GoogleFonts.poppins(
                    fontSize: 21.5, fontWeight: FontWeight.w600),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.close_outlined),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDrawerBuilder()),
                      (route) => false);
                },
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(
                top: getHeight(context) / 15.0,
                left: getWidth(context) / 20.0,
                right: getWidth(context) / 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'v' + versionNumber.toString(),
                  style: GoogleFonts.poppins(
                      fontSize: 17.0, fontWeight: FontWeight.w500),
                ),

                // New features and Fixes widgets. Just comment if one of them is not present
                NewFeatures(),
                Fixes()
              ],
            ),
          ),
        ));
  }
}
