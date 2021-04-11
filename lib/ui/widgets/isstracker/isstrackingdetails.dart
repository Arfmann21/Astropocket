import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IssTrackingDetails extends StatelessWidget {
  final AsyncSnapshot snapshot;

  IssTrackingDetails({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: getWidth(context) / 15.0,
          ),
          child: Text(
            'Tracking details',
            style: GoogleFonts.poppins(
                fontSize: 21.5, fontWeight: FontWeight.w700),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: getWidth(context) / 20.0),
            child: Text(
              snapshot.data.lat.toStringAsFixed(5) + '°',
              style: GoogleFonts.poppins(
                fontSize: 19.0,
                fontWeight: FontWeight.w500,
              ),
            )),
        Text(
          'Latitude',
          style: GoogleFonts.poppins(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: SpecificColors(context).secondaryTextColor),
        ),
        Container(
            margin: EdgeInsets.only(top: getWidth(context) / 15.0),
            child: Text(
              snapshot.data.long.toStringAsFixed(5) + '°',
              style: GoogleFonts.poppins(
                fontSize: 19.0,
                fontWeight: FontWeight.w500,
              ),
            )),
        Text(
          'Longitude',
          style: GoogleFonts.poppins(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: SpecificColors(context).secondaryTextColor),
        ),
        Container(
            margin: EdgeInsets.only(top: getWidth(context) / 15.0),
            child: Text(
              snapshot.data.altitude.toStringAsFixed(5) + 'km',
              style: GoogleFonts.poppins(
                fontSize: 19.0,
                fontWeight: FontWeight.w500,
              ),
            )),
        Text(
          'Altitude',
          style: GoogleFonts.poppins(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: SpecificColors(context).secondaryTextColor),
        ),
        Container(
            margin: EdgeInsets.only(top: getWidth(context) / 15.0),
            child: Text(
              snapshot.data.velocity.toStringAsFixed(5) + 'km/h',
              style: GoogleFonts.poppins(
                fontSize: 19.0,
                fontWeight: FontWeight.w500,
              ),
            )),
        Text(
          'Velocity',
          style: GoogleFonts.poppins(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              color: SpecificColors(context).secondaryTextColor),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: getWidth(context) / 20.0),
        )
      ],
    );
  }
}
