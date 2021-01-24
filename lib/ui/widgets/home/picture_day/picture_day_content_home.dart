import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PictureDayContentHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: getHeight(context) / 62),

        // Use RichText to combine normal, bold and italic in the same text
        child: RichText(
            textAlign: TextAlign.justify,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                // Set default TextStyle for the entire TextSpan
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                    color: SpecificColors(context).lightGreyDarkGreyColor),

                // The actuals texts
                children: [
                  TextSpan(text: apodObject.title + ' - '),

                  /// Only the first must be bold for this UI
                  TextSpan(
                      text: apodObject.explanation,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600))
                ])));
  }
}
