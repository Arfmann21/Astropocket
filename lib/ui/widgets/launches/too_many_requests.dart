import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.only(top: getHeight(context) / 20.0),
          child: Column(children: [
            Container(
                height: getHeight(context) / 6.22,
                margin: EdgeInsets.only(top: getHeight(context) / 11.6),
                child: Image.asset('assets/images/no_connection.png')),
            Padding(
              padding: EdgeInsets.only(
                  top: getHeight(context) / 31.1,
                  left: getWidth(context) / 18.0,
                  right: getWidth(context) / 18.0),
              child: Text(
                'Seems like the server is not responding',
                style: GoogleFonts.poppins(
                    fontSize: 17.0, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: Text(
                'Try again later ',
                style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: SpecificColors(context).blueGreenColor),
              ),
            ),
          ])),
    );
  }
}
