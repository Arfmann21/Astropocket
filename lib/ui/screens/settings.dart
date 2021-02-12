import 'package:astropocket/backend/global_variables.dart';
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
          child: Text(
            'Settings & info',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 21.5
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: getWidth(context) / 30.0, right: getWidth(context) / 30.0, top: getHeight(context) / 20.0),
        child: Column(
          children: [
            SettingsSection()
          ],
        ),
      ),
    );
  }
}