import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/issdateparse.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IssNextPasseDetails extends StatelessWidget {
  final snapshot;

  IssNextPasseDetails({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Material(
          color: Colors.transparent,
          child: Text(
            'Next passe details',
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 21),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
              top: getWidth(context) / 15.0,
              left: getWidth(context) / 20.0,
              right: getWidth(context) / 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                IssDateParse().parse(DateTime.fromMillisecondsSinceEpoch(
                    snapshot['startUTC'] * 1000)),
                style: GoogleFonts.poppins(
                    fontSize: 17.0, fontWeight: FontWeight.w600),
              ),
              Container(
                margin: EdgeInsets.only(top: getWidth(context) / 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateTime.fromMillisecondsSinceEpoch(
                              snapshot['startUTC'] * 1000)
                          .toString()
                          .substring(11, 19),
                      style: GoogleFonts.poppins(
                          fontSize: 17.0, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      DateTime.fromMillisecondsSinceEpoch(
                              snapshot['endUTC'] * 1000)
                          .toString()
                          .substring(11, 19),
                      style: GoogleFonts.poppins(
                          fontSize: 17.0, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Start time',
                      style: GoogleFonts.poppins(
                          fontSize: 13.0,
                          color: SpecificColors(context).secondaryTextColor),
                    ),
                    Text(
                      'End time',
                      style: GoogleFonts.poppins(
                          fontSize: 13.0,
                          color: SpecificColors(context).secondaryTextColor),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: getWidth(context) / 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (snapshot['duration'] / 60.0).toInt().toString() +
                          'm ' +
                          (snapshot['duration'] % 60).toString() +
                          's',
                      style: GoogleFonts.poppins(
                          fontSize: 17.0, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      snapshot['mag'].toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 17.0, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Duration',
                      style: GoogleFonts.poppins(
                          fontSize: 13.0,
                          color: SpecificColors(context).secondaryTextColor),
                    ),
                    Text(
                      'Magnitude',
                      style: GoogleFonts.poppins(
                          fontSize: 13.0,
                          color: SpecificColors(context).secondaryTextColor),
                    )
                  ],
                ),
              ),

              // Separator
              Container(
                width: getWidth(context),
                height: getWidth(context) / 180,
                margin: EdgeInsets.only(
                    top: getHeight(context) / 20,
                    bottom: getHeight(context) / 20.0),
                color: SpecificColors(context).blueGreenColor,
              ),

              Text(
               'Azimuth',
                style: GoogleFonts.poppins(
                    fontSize: 17.0, fontWeight: FontWeight.w600),
              ),
              Container(
                margin: EdgeInsets.only(top: getWidth(context) / 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     snapshot['startAzCompass'] + " " + snapshot['startAz'].toString() + "°",
                      style: GoogleFonts.poppins(
                          fontSize: 17.0, fontWeight: FontWeight.w500),
                    ),
                    Text(
                    snapshot['endAzCompass'] + " " + snapshot['endAz'].toString() + "°",
                      style: GoogleFonts.poppins(
                          fontSize: 17.0, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Start AZ',
                      style: GoogleFonts.poppins(
                          fontSize: 13.0,
                          color: SpecificColors(context).secondaryTextColor),
                    ),
                    Text(
                      'End AZ',
                      style: GoogleFonts.poppins(
                          fontSize: 13.0,
                          color: SpecificColors(context).secondaryTextColor),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: getWidth(context) / 20.0),
                child: Text(
                snapshot['maxAzCompass'] + " " + snapshot['maxAz'].toString() + "°",
                  style: GoogleFonts.poppins(
                      fontSize: 17.0, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: Text(
                  'Max AZ',
                  style: GoogleFonts.poppins(
                      fontSize: 13.0,
                      color: SpecificColors(context).secondaryTextColor),
                ),
              ),

               // Separator
              Container(
                width: getWidth(context),
                height: getWidth(context) / 180,
                margin: EdgeInsets.only(
                    top: getHeight(context) / 20,
                    bottom: getHeight(context) / 20.0),
                color: SpecificColors(context).blueGreenColor,
              ),

              Text(
               'Elevation',
                style: GoogleFonts.poppins(
                    fontSize: 17.0, fontWeight: FontWeight.w600),
              ),
              Container(
                margin: EdgeInsets.only(top: getWidth(context) / 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     snapshot['startEl'].toString() + "°",
                      style: GoogleFonts.poppins(
                          fontSize: 17.0, fontWeight: FontWeight.w500),
                    ),
                    Text(
                    snapshot['endEl'].toString() + "°",
                      style: GoogleFonts.poppins(
                          fontSize: 17.0, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Start elevation',
                      style: GoogleFonts.poppins(
                          fontSize: 13.0,
                          color: SpecificColors(context).secondaryTextColor),
                    ),
                    Text(
                      'End elevation',
                      style: GoogleFonts.poppins(
                          fontSize: 13.0,
                          color: SpecificColors(context).secondaryTextColor),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: getWidth(context) / 20.0),
                child: Text(
                snapshot['maxEl'].toString() + "°",
                  style: GoogleFonts.poppins(
                      fontSize: 17.0, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: Text(
                  'Max elevation',
                  style: GoogleFonts.poppins(
                      fontSize: 13.0,
                      color: SpecificColors(context).secondaryTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
