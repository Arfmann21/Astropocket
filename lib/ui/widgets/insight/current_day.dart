import 'package:astropocket/backend/date_parse.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsightCurrentDay extends StatefulWidget {
  final reversedSolKeys;
  final weatherData;

  InsightCurrentDay({this.reversedSolKeys, this.weatherData});
  @override
  _InsightCurrentDayState createState() => _InsightCurrentDayState();
}

class _InsightCurrentDayState extends State<InsightCurrentDay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/images/insigth.jpg',
          fit: BoxFit.cover,
        ),

        // Title
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: getWidth(context) / 1.8,
            padding: EdgeInsets.only(
                top: getWidth(context) / 30.0, left: getWidth(context) / 36.0),
            child: Text(
              'Latest Weather at Gale Crater',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  color: Color(0xFFE6E6E6)),
            ),
          ),
        ),

        // Current day weather info
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [

              // Dark background to avoid poor contrast bewteen text and image
              Container(
                height: getHeight(context) / 7.0,
                width: getWidth(context),
                color: SpecificColors(context).timerBackgroundColor,
              ),

              // General padding for info
              Padding(
                padding: EdgeInsets.only(
                    top: getWidth(context) / 36.0,
                    left: getWidth(context) / 36.0,
                    right: getWidth(context) / 36.0),
                
                // The actual info widgets
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    // Mars day
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sol ${widget.reversedSolKeys[0]}',
                          style: GoogleFonts.poppins(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFE6E6E6)),
                        ),

                      /*  // Highest temperature of the day
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'High: ',
                              style: GoogleFonts.poppins(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                  color: SpecificColors(context).marsHighColor),
                            ),
                            TextSpan(
                              text: TemperatureParsing(
                                      temp: widget.weatherData[0]['PRE']['mx']
                                          .round())
                                  .getParsedTemp(),
                              style: GoogleFonts.poppins(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFD9D9D9)),
                            )
                          ]),
                        ),
                      ],
                    ),*/
                    Padding(
                      padding: EdgeInsets.only(top: getWidth(context) / 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          // Earth day
                          Text(
                            DateParse(DateTime.parse(widget.weatherData[0]['First_UTC']))
                                .getParse()
                                .toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFd9d9d9)),
                          ),

                        /*  // Lowest temperature of the day
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Low: ',
                                style: GoogleFonts.poppins(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        SpecificColors(context).marsLowColor),
                              ),
                              TextSpan(
                                text: TemperatureParsing(
                                        temp: widget.weatherData[0]['PRE']['mn']
                                            .round())
                                    .getParsedTemp(),
                                style: GoogleFonts.poppins(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFD9D9D9)),
                              )
                            ]),
                          ),*/
                        ],
                      ),
                ),
                      ]
                ),
            ],
          ),
        ),
      ],
          ),
        ),
      ]
    );
  }
}
