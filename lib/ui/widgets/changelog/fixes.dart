import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/custom_icons/newspaper_icon_icons.dart';
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
                    text: 'Dates bug:',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      color: SpecificColors(context).primaryTextColor,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' fixed a bug for dates that, in some case, were returning an undefined error',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      color: SpecificColors(context).secondaryTextColor,
                    ),
                  ),
                ]),
              ),
            ),
      ],
    );
  }
}