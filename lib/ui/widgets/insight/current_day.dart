import 'package:astropocket/backend/api/mars_weather_api.dart';
import 'package:astropocket/backend/date_parse.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/temperature_parsing.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarsWeatherCurrentDay extends StatefulWidget {
  final AsyncSnapshot<MarsWeatherApi?> snapshot;

  MarsWeatherCurrentDay({required this.snapshot});
  @override
  _MarsWeatherCurrentDayState createState() => _MarsWeatherCurrentDayState();
}

class _MarsWeatherCurrentDayState extends State<MarsWeatherCurrentDay> {
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
          child: Container(
            height: getHeight(context) / 7.0,
            width: getWidth(context),
            color: SpecificColors(context).timerBackgroundColor,
            child: Stack(
              children: [
                // General padding for info
          Padding(
            padding: EdgeInsets.only(
                left: getWidth(context) / 36.0,
                right: getWidth(context) / 36.0),
            
            // The actual info widgets
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // Mars day
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sol ${widget.snapshot.data!.sol}',
                        style: GoogleFonts.poppins(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE6E6E6)),
                      ),

                      // Highest temperature of the day
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
                                    temp: widget.snapshot.data!.maxTemp
                                        !.round())
                                .getParsedTemp(),
                            style: GoogleFonts.poppins(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFD9D9D9)),
                          )
                        ]),
                      ),
                    ],
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(top: getWidth(context) / 100.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        // Earth day
                        Text(
                          DateParse(DateTime.parse(widget.snapshot.data!.terrestrialDate.toString()))
                              .getParse()
                              .toString(),
                          style: GoogleFonts.poppins(
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFd9d9d9)),
                        ),

                        // Lowest temperature of the day
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
                                      temp: widget.snapshot.data!.minTemp
                                          !.round())
                                  .getParsedTemp(),
                              style: GoogleFonts.poppins(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFD9D9D9)),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                ]
              ),
            ),
          ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
