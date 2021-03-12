import 'dart:async';

import 'package:astropocket/backend/api/insight_weather_api.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/widgets/insight/current_day.dart';
import 'package:astropocket/ui/widgets/launches/too_many_requests.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class MarsWeather extends StatefulWidget {
  @override
  _MarsWeatherState createState() => _MarsWeatherState();
}

class _MarsWeatherState extends State<MarsWeather> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        Navigator.pop(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Material(
            color: Colors.transparent,
            child: Text(
              'InSight Weather',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 21.0),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: getHeight(context) / 70.0,
              left: getWidth(context) / 36.0,
              right: getWidth(context) / 36.0),
          child: FutureBuilder<InsightWeatherApi>(
              future: fetchInsightWeatherApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {

                    // The API returns the keys from the earlier to the most recent: it must be the opposite
                    var reversedSolKeys =
                        snapshot.data.solKeys.reversed.toList();

                    var weatherData = [];

                    for (int i = 0; i < reversedSolKeys.length; i++)
                      weatherData
                          .add(snapshot.data.general[reversedSolKeys[i]]);
                          
                    return SingleChildScrollView(
                      child: Column(
                        children: [

                          // The current day weather
                          Container(
                              height: getHeight(context) / 3,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          getWidth(context) / 36.0)),
                                  child: InsightCurrentDay(
                                    reversedSolKeys: reversedSolKeys,
                                    weatherData: weatherData,
                                  ))),

                          // Separator between current day and previous days
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: getWidth(context) / 180,
                            margin: EdgeInsets.only(
                                left: getWidth(context) / 20,
                                right: getWidth(context) / 20,
                                top: MediaQuery.of(context).size.height / 20),
                            color: SpecificColors(context).secondaryTextColor,
                          ),

                          // Previous days title
                         /* Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(
                                top: getWidth(context) / 20.0,
                                left: getWidth(context) / 36.0),
                            child: Text(
                              'Previous days',
                              style: GoogleFonts.poppins(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),*/

                          Padding(
                            padding: EdgeInsets.only(top: getHeight(context) / 10.0),
                            child: Center(
                              child: Text(
                                'NASA has temporarily suspended daily weather measurements.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  
                                ),
                              ),
                            ),
                          ),

                          // Build the list of previous days weather
                         /* ListView.separated(
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: getWidth(context) / 36.0),
                              );
                            },
                            // The scrolling must affect the entire screen, not only the ListView
                            // Since there is already a SingleChildScrollView as root, remove the scrolling from ListView
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            // One item is already viewed (current day): length - 1
                            itemCount: reversedSolKeys.length - 1,
                            itemBuilder: (context, index) {
                              // General padding
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: getWidth(context) / 30.0,
                                    right: getWidth(context) / 36.0,
                                    top: getWidth(context) / 30.0),

                                // The actual previous days weather
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // They must be left-centered
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Mars day
                                        Text(
                                          'Sol ${reversedSolKeys[index + 1]}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500),
                                        ),

                                        // Earth day
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: getWidth(context) / 50.0),
                                          child: Text(
                                            DateParse(DateTime.parse(
                                                    weatherData[index + 1]
                                                        ['First_UTC']))
                                                .getParse()
                                                .toString(),
                                            style: GoogleFonts.poppins(
                                                fontSize: 15.5,
                                                color: SpecificColors(context)
                                                    .secondaryTextColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Highest temperature of the day
                                        RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text: 'High: ',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: SpecificColors(context)
                                                      .marsHighColor),
                                            ),
                                            TextSpan(
                                              text: TemperatureParsing(
                                                      temp:
                                                          weatherData[index + 1]
                                                                  ['PRE']['mx']
                                                              .round())
                                                  .getParsedTemp(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: SpecificColors(context)
                                                      .primaryTextColor),
                                            )
                                          ]),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: getWidth(context) / 30.0),
                                          // Lowest temperature of the day
                                          child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Low: ',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        SpecificColors(context)
                                                            .marsLowColor),
                                              ),
                                              TextSpan(
                                                text: TemperatureParsing(
                                                        temp: weatherData[
                                                                    index + 1]
                                                                ['PRE']['mn']
                                                            .round())
                                                    .getParsedTemp(),
                                                style: GoogleFonts.poppins(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        SpecificColors(context)
                                                            .primaryTextColor),
                                              )
                                            ]),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),*/
                          Padding(
                            padding:
                                EdgeInsets.only(top: getWidth(context) / 30.0),
                          )
                        ],
                      ),
                    );
                  } else {
                    return RequestError();
                  }
                } else
                  // The loading indicator
                  return Container(
                    height: getHeight(context) / 3,
                    width: getWidth(context),
                    margin: EdgeInsets.only(
                        top: getHeight(context) / 70.0,
                        left: getWidth(context) / 36.0,
                        right: getWidth(context) / 36.0),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(getWidth(context) / 36.0),
                      child: Skeleton(
                        baseColor: SpecificColors(context).pulseColorBase,
                        // The Highlight color is the same for both white and dark theme
                        hightlightColor: const Color(0xFF053361),
                      ),
                    ),
                  );
              }),
        ));
  }
}
