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
  var isMdy = mdy;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
        Padding(
          padding: EdgeInsets.only(top: getWidth(context) / 20.0),
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
                  SetSettings().setSettings('isCelsius', value);
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
        Padding(
          padding: EdgeInsets.only(top: getHeight(context) / 25.0),
          child: Row(
            children: [
              Icon(RocketIcon.rocket_outline),
              Padding(
                padding: EdgeInsets.only(left: getWidth(context) / 36.0),
                child: Text(
                  'Launches',
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
            padding: EdgeInsets.only(top: getWidth(context) / 20.0),
            child: Column(
              children: [
                RadioListTile<bool>(
                  value: mdy,
                  groupValue: isMdy,
                  onChanged: (value) {
                    setState(() {
                      isMdy = value;
                    });
                    SetSettings().setSettings('mdy', value);
                    print(isMdy);
                  },
                ),
                RadioListTile<bool>(
                  value: dmy,
                  groupValue: isMdy,
                  onChanged: (value) {
                    setState(() {
                      isMdy = value;
                    });
                    SetSettings().setSettings('dmy', value);
                  },
                )
              ],
            ))
      ],
    );
  }
}
