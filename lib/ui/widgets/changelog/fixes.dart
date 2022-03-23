import 'package:astropocket/backend/changelog_data.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fixes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: getHeight(context) / 20.0),
          child: Row(
            children: [
              Icon(Icons.tune_outlined),
              Padding(
                padding: EdgeInsets.only(left: getWidth(context) / 30.0),
                child: Text(
                  'Fixes',
                  style: GoogleFonts.poppins(
                      fontSize: 19.0, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: getWidth(context) / 40.0),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: ChangelogData().fixesTitles.length,
            itemBuilder: (context, i) {
              return Padding(
              padding: EdgeInsets.only(top: getHeight(context) / 40.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: ChangelogData().fixesTitles[i],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: SpecificColors(context).primaryTextColor,
                    ),
                  ),
                  TextSpan(
                    text: ChangelogData().fixesContent[i],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                      color: SpecificColors(context).secondaryTextColor,
                    ),
                  ),
                ]),
              ),
            );
            }
          ),
        ),
      ],
    );
  }
}
