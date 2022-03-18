import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/widgets/settings_info/info_section.dart';
import 'package:astropocket/ui/widgets/settings_info/settings_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Material(
          color: Colors.transparent,
          child: Text(
            'Settings & info',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 21.5),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: getHeight(context) / 20.0),
          child: Column(
            children: [
              SettingsSection(),

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
                    top: getHeight(context) / 25.0,
                    left: getWidth(context) / 20.0,
                    right: getWidth(context) / 20.0),
                child: InfoSection(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
