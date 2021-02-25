import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/custom_icons/newspaper_icon_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewFeatures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: getHeight(context) / 20.0),
          child: Row(
            children: [
              Icon(NewspaperIcon.newspaper_variant_outline),
              Padding(
                padding: EdgeInsets.only(left: getWidth(context) / 30.0),
                child: Text(
                  'New features',
                  style: GoogleFonts.poppins(
                      fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: getHeight(context) / 30.0),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Changelog:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: SpecificColors(context).primaryTextColor,
                ),
              ),
              TextSpan(
                text:
                    ' you will now see the changelog whenever the app is updated. \nNote: it will not be displayed if is your first access to the app.',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  color: SpecificColors(context).secondaryTextColor,
                ),
              ),
              TextSpan(
                text: '\n\nMoon phases:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: SpecificColors(context).primaryTextColor,
                ),
              ),
              TextSpan(
                text:
                    ' you can now get the moon phase for a given date, with a full calendar.',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  color: SpecificColors(context).secondaryTextColor,
                ),
              ),
              TextSpan(
                text: '\n\nSettings & info:',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                  color: SpecificColors(context).primaryTextColor,
                ),
              ),
              TextSpan(
                text:
                    ' you can now set Celsius temperature unit for InSight Weather, change the date format for launches and view the info of the app.',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  color: SpecificColors(context).secondaryTextColor,
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
