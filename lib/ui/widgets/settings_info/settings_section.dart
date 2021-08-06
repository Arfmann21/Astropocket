import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/set_settings.dart';
import 'package:astropocket/style/custom_icons/rocket_icon_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsSection extends StatefulWidget {
  @override
  _SettingsSectionState createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  var type = dateFormat;

  var distanceUnitType = distanceUnit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: getWidth(context) / 20.0, right: getWidth(context) / 20.0),
          child: Row(
            children: [
              Icon(Icons.wb_sunny_outlined),
              Padding(
                padding: EdgeInsets.only(left: getWidth(context) / 36.0),
                child: Text(
                  'InSight Weather',
                  style: GoogleFonts.poppins(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      color: SpecificColors(context).primaryTextColor),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: getWidth(context) / 20.0, left: getWidth(context) / 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: getWidth(context) / 1.5,
                child: Text(
                  'Use Celsius instead of Fahrenheit',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: SpecificColors(context).secondaryTextColor),
                ),
              ),
              Checkbox(
                value: isCelsius,
                onChanged: (value) {
                  SetSettings().setSettings('isCelsius', value, bool);
                  setState(() {
                    isCelsius = !isCelsius;
                  });
                },
                checkColor: SpecificColors(context).checkboxcCheckedColor,
                activeColor: SpecificColors(context).checkboxActiveBoxColor,
              )
            ],
          ),
        ),

        // Separator
        Container(
          width: MediaQuery.of(context).size.width,
          height: getWidth(context) / 180,
          margin: EdgeInsets.only(
              left: getWidth(context) / 20,
              right: getWidth(context) / 20,
              top: MediaQuery.of(context).size.height / 20),
          color: SpecificColors(context).blueGreenColor,
        ),

        Padding(
          padding: EdgeInsets.only(
              top: getHeight(context) / 25.0, left: getWidth(context) / 20.0),
          child: Row(
            children: [
              Icon(Icons.public_outlined),
              Padding(
                padding: EdgeInsets.only(left: getWidth(context) / 36.0),
                child: Text(
                  'Planets distance unit',
                  style: GoogleFonts.poppins(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      color: SpecificColors(context).primaryTextColor),
                ),
              )
            ],
          ),
        ),

        Padding(
            padding: EdgeInsets.only(
                top: getWidth(context) / 20.0, left: getWidth(context) / 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile<String>(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  activeColor: SpecificColors(context).checkboxActiveBoxColor,
                  value: "miles",
                  groupValue: distanceUnitType,
                  title: Text(
                    'Miles',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: SpecificColors(context).secondaryTextColor),
                  ),
                  onChanged: (value) {
                    setState(() {
                      distanceUnitType = "miles";
                      distanceUnit = distanceUnitType;
                    });
                    SetSettings().setSettings('distanceUnit', "miles", String);
                    isKilometers = false;
                  },
                ),
                RadioListTile<String>(
                  activeColor: SpecificColors(context).checkboxActiveBoxColor,
                  contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                  value: "kilometers",
                  title: Text(
                    'Kilometers',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: SpecificColors(context).secondaryTextColor),
                  ),
                  groupValue: distanceUnitType,
                  onChanged: (value) {
                    setState(() {
                      distanceUnitType = "kilometers";
                      distanceUnit = distanceUnitType;
                    });
                    SetSettings()
                        .setSettings('distanceUnit', "kilometers", String);
                      isKilometers = true;
                  },
                ),
              ],
            )),

        // Separator
        Container(
          width: MediaQuery.of(context).size.width,
          height: getWidth(context) / 180,
          margin: EdgeInsets.only(
              left: getWidth(context) / 20,
              right: getWidth(context) / 20,
              top: MediaQuery.of(context).size.height / 20),
          color: SpecificColors(context).blueGreenColor,
        ),

        Padding(
          padding: EdgeInsets.only(
              top: getHeight(context) / 25.0, left: getWidth(context) / 20.0),
          child: Row(
            children: [
              Icon(RocketIcon.rocket_outline),
              Padding(
                padding: EdgeInsets.only(left: getWidth(context) / 36.0),
                child: Text(
                  'Launches date format',
                  style: GoogleFonts.poppins(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      color: SpecificColors(context).primaryTextColor),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: getWidth(context) / 20.0, left: getWidth(context) / 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile<String>(
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                activeColor: SpecificColors(context).checkboxActiveBoxColor,
                value: "mdy",
                groupValue: type,
                title: Text(
                  'Month / Day / Year',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: SpecificColors(context).secondaryTextColor),
                ),
                onChanged: (value) {
                  setState(() {
                    type = "mdy";
                    dateFormat = type;
                  });
                  SetSettings().setSettings('dateFormat', "mdy", String);
                },
              ),
              RadioListTile<String>(
                activeColor: SpecificColors(context).checkboxActiveBoxColor,
                contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                value: "dmy",
                title: Text(
                  'Day / Month / Year',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: SpecificColors(context).secondaryTextColor),
                ),
                groupValue: type,
                onChanged: (value) {
                  setState(() {
                    type = "dmy";
                    dateFormat = type;
                  });
                  SetSettings().setSettings('dateFormat', "dmy", String);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
