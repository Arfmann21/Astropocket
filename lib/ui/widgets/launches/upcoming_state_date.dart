import 'dart:async';

import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/launch_state_parse.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchesListStateDateWidget extends StatefulWidget {
  final index;
  final snapshot;

  LaunchesListStateDateWidget({this.index, this.snapshot});

  @override
  _LaunchesListStateDateWidgetState createState() =>
      _LaunchesListStateDateWidgetState();
}

class _LaunchesListStateDateWidgetState extends State<LaunchesListStateDateWidget> {
  var stateIndex;
  var stateSnapshot;
  int timeDiff;

  @override
  void initState() {
    stateIndex = widget.index;
    stateSnapshot = widget.snapshot;
    timeDiff =
        DateTime.parse(stateSnapshot.data.general[stateIndex]['window_start'])
            .difference(DateTime.now())
            .inSeconds;
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  static const duration = const Duration(seconds: 1);
  bool isActive = true;

  Timer timer;

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        if (timeDiff > 0) {
          setState(() {
            if (mounted) if (DateTime.parse(
                    stateSnapshot.data.general[stateIndex]['window_start']) !=
                DateTime.now()) {
              timeDiff -= 1;
            }
          });
        }
      });
    }

    int days = timeDiff ~/ (24 * 60 * 60);
    int hours = timeDiff ~/ (60 * 60) % 24;
    int minutes = (timeDiff ~/ 60) % 60;
    int seconds = timeDiff % 60;

    return Stack(
      children: [
        // A general padding for each index item
        Padding(
          padding: EdgeInsets.only(
              top: getHeight(context) / 30.0,
              left: getWidth(context) / 20.0,
              right: getWidth(context) / 20.0,
              bottom: getWidth(context) / 15.0),

          // Container to set the height
          child: Container(
            height: getHeight(context) / 7.0,
            width: getWidth(context),

            // Padding to add a fixed bottom space under the state container
            padding: EdgeInsets.only(bottom: getWidth(context) / 30.0),

            // To add the border and its color
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getWidth(context) / 36.0),
                border: Border.all(
                  width: 2,
                  color: Color(0xFFD58235),
                )),

            child: Padding(
              padding: EdgeInsets.only(top: getWidth(context) / 20.0),

              // Column for state and date
              child: Column(
                children: [
                  Text(
                    // Parse the date
                    LaunchDataParse(
                            date: stateSnapshot.data.general[stateIndex]
                                ['window_start'])
                        .dateParse(),
                    style: GoogleFonts.poppins(fontSize: 16.0, color: SpecificColors(context).secondaryTextColor),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getWidth(context) / 36.0),
                    child: Text(
                      LaunchDataParse(
                                  state: stateSnapshot.data.general[stateIndex]
                                      ['status']['name'])
                              .isUpcomingLaunched()
                          ? 'Launched'
                          : days.toString() +
                              'dd ' +
                              hours.toString() +
                              'h ' +
                              minutes.toString() +
                              'm ' +
                              seconds.toString() +
                              's',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: SpecificColors(context).primaryTextColor
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        // To set a "blank" space in the rectangle
        Center(
          child: Container(
              width: getWidth(context) / 2.0,
              height: getWidth(context) / 10.0,
              color: SpecificColors(context).backgroundAsCardColor),
        ),

        Padding(
          padding: EdgeInsets.only(
            top: getHeight(context) / 60.0,
          ),
          child: Center(
            // Current status
            child: Text(
              LaunchDataParse(
                      state: stateSnapshot.data.general[stateIndex]['status']
                          ['name'])
                  .stateParse(),
              style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: stateSnapshot.data.general[stateIndex]['status']
                              ['name'] ==
                          'Failure' || stateSnapshot.data.general[stateIndex]['status']
                              ['name'] ==
                          'Partial Failure'
                      ? SpecificColors(context).launchFailedColor
                      : SpecificColors(context).stateColor),
            ),
          ),
        ),
      ],
    );
  }
}
