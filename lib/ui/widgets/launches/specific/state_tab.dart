import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/launch_state_parse.dart';
import 'package:astropocket/backend/url_launcher.dart';
import 'package:astropocket/style/custom_icons/youtube_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecificLaunchStateTab extends StatelessWidget {
  final selectedIndex;

  SpecificLaunchStateTab({this.selectedIndex});

  // Set state and date on those 2 variables, to keep things more organized. Final because the class is @immutable
  final String state =
      LaunchDataParse(state: launchesObject.state).stateParse();
  final String date =
      LaunchDataParse(date: launchesObject.launchDate).dateParse();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        // Must shown only if index == 0, which means the tab is selected
        opacity: selectedIndex == 0 ? 1.0 : 0.0,
        duration: Duration(milliseconds: 200),

        child: Column(
          children: [
            // State of the launch
            Container(
              margin: EdgeInsets.only(top: getWidth(context) / 36.0),
              child: Text(
                state,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w600,
                    color: launchesObject.state == 'Failure' || launchesObject.state == 'Partial Failure' ? SpecificColors(context).launchFailedColor : SpecificColors(context).stateColor),
              ),
            ),

            // Date of the launch
            Container(
              child: Text(date),
            ),

            // Livestream container
            Container(
              width: getWidth(context) / 1.19,
              height: getHeight(context) / 3.7,
              padding: EdgeInsets.only(
                  top: getWidth(context) / 20.0,
                  bottom: getWidth(context) / 50.0),

              // Use card to give elevation
              child: Card(
                // Sometimes the livestream is not avaible: show a card with a text, so set a color to the Card
                color: SpecificColors(context).unavaibleLaunchVideoColor,

                // Set borderRadius to the card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(getWidth(context) / 36.0),
                ),

                  // Show widget based on live stream availability
                child: launchesObject.liveUrl != 'No video avaibles'
                    ? 
                    // If avaible, show the thumbanil: the user can see the livestream by tappin it
                    GestureDetector(
                        onTap: () {
                          launchURL(launchesObject.liveUrl);
                        },

                        // Over the thumbnail there must be the YouTube Icon
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: "https://img.youtube.com/vi/" +
                                    launchesObject.liveUrl
                                        .replaceAll(
                                            "https://www.youtube.com/watch?v=",
                                            "")
                                        .replaceAll("?rel=0", "") +
                                    "/0.jpg"),
                            Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                  child: Icon(
                                Youtube.youtube,
                                size: 46,
                                color: SpecificColors(context).shimmerColor,
                              )),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Text(
                        launchesObject.liveUrl,
                        style: GoogleFonts.poppins(
                            color: Color(0xFFe6e6e6), fontSize: 15.0),
                      )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
