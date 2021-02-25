import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecificLaunchRocketTab extends StatefulWidget {
  final selectedIndex;

  SpecificLaunchRocketTab({this.selectedIndex});

  @override
  _SpecificLaunchRocketTabState createState() => _SpecificLaunchRocketTabState();
}

class _SpecificLaunchRocketTabState extends State<SpecificLaunchRocketTab> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: widget.selectedIndex == 2 ? 1.0 : 0.0,
        duration: Duration(milliseconds: 200),
        child: widget.selectedIndex == 2
            ? Column(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: getWidth(context) / 1.3,
                          padding:
                              EdgeInsets.only(top: getWidth(context) / 36.0),
                          child: Text(
                            launchesObject.rocketName,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 20.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      launchesObject.rocketDescription.length > 150
                          ? Container(
                              alignment: Alignment.centerRight,

                              // The dropdown icon must be rotated when the description is expanded (and viceversa)
                              child: Transform.rotate(
                                alignment: Alignment.center,
                                angle: isExpanded ? 180 * 3.14 / 180 : 0,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  iconSize: 32.0,
                                  onPressed: () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: getWidth(context) / 15.0),
                    child: Text(
                      launchesObject.rocketDescription,
                      textAlign: TextAlign.justify,
                      maxLines: isExpanded ? 150 : 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color:
                              SpecificColors(context).secondaryTextColor),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: getWidth(context) / 180,
                    margin: EdgeInsets.only(
                        left: getWidth(context) / 20,
                        right: getWidth(context) / 20,
                        top: MediaQuery.of(context).size.height / 20),
                    color: SpecificColors(context).blueGreenColor,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: getWidth(context) / 15.0),
                    width: getWidth(context),
                    child: Column(
                      children: [
                        Container(
                          height: getWidth(context) / 5.0,
                          width: getWidth(context),
                          child: CachedNetworkImage(
                              fit: BoxFit.scaleDown,
                              imageUrl: launchesObject.rocketProviderLogo ??
                                  launchesObject.launchServiceProviderLogo),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: getWidth(context) / 15.0,
                              bottom: getWidth(context) / 15.0),
                          child: Text(
                            launchesObject.rocketProvider,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500, fontSize: 17.0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            : null);
  }
}
