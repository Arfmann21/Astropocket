import 'dart:async';

import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/launch_state_parse.dart';
import 'package:astropocket/backend/url_launcher.dart';
import 'package:astropocket/style/custom_icons/youtube_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

class SpecificLaunch extends StatefulWidget {
  final String heroTag;

  SpecificLaunch({this.heroTag});

  @override
  _SpecificLaunchState createState() => _SpecificLaunchState();
}

class _SpecificLaunchState extends State<SpecificLaunch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  static const duration = const Duration(seconds: 1);

  int timeDiff = DateTime.parse(launchesObject.launchDate)
      .difference(DateTime.now())
      .inSeconds;

  Timer timer;

  String state = LaunchDataParse(state: launchesObject.state).stateParse();
  String date = LaunchDataParse(date: launchesObject.launchDate).dateParse();
  bool isTimerActive;

  int selectedIndex = 0;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        if (timeDiff > 0) {
          setState(() {
            isTimerActive = true;
            timeDiff -= 1;
          });
        } else {
          setState(() {
            isTimerActive = false;
          });
        }
      });
    }

    int days = timeDiff ~/ (24 * 60 * 60);
    int hours = timeDiff ~/ (60 * 60) % 24;
    int minutes = (timeDiff ~/ 60) % 60;
    int seconds = timeDiff % 60;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Launch',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.share_outlined),
                  onPressed: () async {
                    await Share.share(
                        '🚀 The ${launchesObject.rocketName} will launch on ${LaunchDataParse(date: launchesObject.launchDate).dateParse()} for the mission ${launchesObject.missionName}|\n\n📱 Track the launch with Astropocket: [link store]');
                  })
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: getHeight(context) / 30.0,
                  left: getWidth(context) / 30.0,
                  right: getWidth(context) / 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: getHeight(context) / 3.5,
                    width: getWidth(context),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(getWidth(context) / 36.0)),
                      child: Stack(
                        children: [
                          Container(
                            height: getHeight(context),
                            width: getWidth(context),
                            child: Hero(
                              tag: widget.heroTag,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    getWidth(context) / 36.0),
                                child: CachedNetworkImage(
                                  imageUrl: launchesObject.launchImageUrl,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) {
                                    return Container();
                                  },
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: getHeight(context) / 13.0,
                              width: getWidth(context),
                              color:
                                  SpecificColors(context).timerBackgroundColor,
                              alignment: Alignment.center,
                              child: Text(
                                LaunchDataParse(state: launchesObject.state)
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
                                    color:
                                        SpecificColors(context).timerTextColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: getHeight(context) / 30.0,
                          bottom: getHeight(context) / 50.0),
                      child: Text(
                        launchesObject.launchName,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 21.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    width: getWidth(context),
                    child: TabBar(
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      labelColor: SpecificColors(context).selectedLabelColor,
                      unselectedLabelColor:
                          SpecificColors(context).unselectedLabelColor,
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: GoogleFonts.poppins(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w600,
                      ),
                      indicator: ContainerTabIndicator(
                          width: getWidth(context) / 10.0,
                          height: getWidth(context) / 100.0,
                          color: SpecificColors(context).selectedLabelColor,
                          padding:
                              EdgeInsets.only(top: getWidth(context) / 25.0),
                          radius:
                              BorderRadius.circular(getWidth(context) / 36.0)),
                      tabs: [
                        Tab(
                          text: 'State',
                        ),
                        Tab(
                          text: 'Mission',
                        ),
                        Tab(
                          text: 'Rocket',
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      Center(
                        child: AnimatedOpacity(
                          opacity: selectedIndex == 0 ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 200),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: getWidth(context) / 36.0),
                                child: Text(
                                  state,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 21.0,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          SpecificColors(context).stateColor),
                                ),
                              ),
                              Container(
                                child: Text(date),
                              ),
                              Container(
                                width: getWidth(context) / 1.19,
                                height: getHeight(context) / 3.7,
                                padding: EdgeInsets.only(
                                    top: getWidth(context) / 20.0,
                                    bottom: getWidth(context) / 50.0),
                                child: Card(
                                  color: SpecificColors(context)
                                      .unavaibleLaunchVideoColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        getWidth(context) / 36.0),
                                  ),
                                  child: launchesObject.liveUrl !=
                                          'No video avaibles'
                                      ? GestureDetector(
                                          onTap: () {
                                            launchURL(launchesObject.liveUrl);
                                          },
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                      "https://img.youtube.com/vi/" +
                                                          launchesObject.liveUrl
                                                              .replaceAll(
                                                                  "https://www.youtube.com/watch?v=",
                                                                  "")
                                                              .replaceAll(
                                                                  "?rel=0",
                                                                  "") +
                                                          "/0.jpg"),
                                              Container(
                                                height: 200,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Center(
                                                    child: Icon(
                                                  Youtube.youtube,
                                                  size: 46,
                                                  color: SpecificColors(context)
                                                      .shimmerColor,
                                                )),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Center(
                                          child: Text(
                                          launchesObject.liveUrl,
                                          style: GoogleFonts.poppins(
                                              color: Color(0xFFe6e6e6),
                                              fontSize: 15.0),
                                        )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: AnimatedOpacity(
                            opacity: selectedIndex == 1 ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 200),
                            child: selectedIndex == 1
                                ? Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Center(
                                            child: Container(
                                              width: getWidth(context) / 1.3,
                                              padding: EdgeInsets.only(
                                                  top:
                                                      getWidth(context) / 36.0),
                                              child: Text(
                                                launchesObject.missionName,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20.0,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                          launchesObject.missionDescription
                                                      .length >
                                                  150
                                              ? Container(
                                                  alignment:
                                                      Alignment.centerRight,

                                                  // The dropdown icon must be rotated when the description is expanded (and viceversa)
                                                  child: Transform.rotate(
                                                    alignment: Alignment.center,
                                                    angle: isExpanded
                                                        ? 180 * 3.14 / 180
                                                        : 0,
                                                    child: IconButton(
                                                      icon: Icon(Icons
                                                          .arrow_drop_down),
                                                      iconSize: 32.0,
                                                      onPressed: () {
                                                        setState(() {
                                                          isExpanded =
                                                              !isExpanded;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: getWidth(context) / 15.0),
                                        child: Text(
                                          launchesObject.missionDescription,
                                          textAlign: TextAlign.justify,
                                          maxLines: isExpanded ? 150 : 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                              color: SpecificColors(context)
                                                  .lightGreyDarkGreyColor),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: getWidth(context) / 180,
                                        margin: EdgeInsets.only(
                                            left: getWidth(context) / 20,
                                            right: getWidth(context) / 20,
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                20),
                                        color: SpecificColors(context)
                                            .darkGreyLightGreyColor,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: getWidth(context) / 15.0),
                                        width: getWidth(context),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: getWidth(context) / 5.0,
                                              width: getWidth(context),
                                              child: CachedNetworkImage(
                                                  fit: BoxFit.scaleDown,
                                                  imageUrl: launchesObject
                                                      .launchServiceProviderLogo),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: getWidth(context) / 15.0,
                                                  bottom:
                                                      getWidth(context) / 15.0),
                                              child: Text(
                                                launchesObject
                                                    .launchServiceProvider,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 17.0),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                : null),
                      ),
                      AnimatedOpacity(
                          opacity: selectedIndex == 2 ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 200),
                          child: selectedIndex == 2
                              ? Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Center(
                                          child: Container(
                                            width: getWidth(context) / 1.3,
                                            padding: EdgeInsets.only(
                                                top: getWidth(context) / 36.0),
                                            child: Text(
                                              launchesObject.rocketName,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                        launchesObject
                                                    .rocketDescription.length >
                                                150
                                            ? Container(
                                                alignment:
                                                    Alignment.centerRight,

                                                // The dropdown icon must be rotated when the description is expanded (and viceversa)
                                                child: Transform.rotate(
                                                  alignment: Alignment.center,
                                                  angle: isExpanded
                                                      ? 180 * 3.14 / 180
                                                      : 0,
                                                  child: IconButton(
                                                    icon: Icon(
                                                        Icons.arrow_drop_down),
                                                    iconSize: 32.0,
                                                    onPressed: () {
                                                      setState(() {
                                                        isExpanded =
                                                            !isExpanded;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: getWidth(context) / 15.0),
                                      child: Text(
                                        launchesObject.rocketDescription,
                                        textAlign: TextAlign.justify,
                                        maxLines: isExpanded ? 150 : 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                            color: SpecificColors(context)
                                                .lightGreyDarkGreyColor),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: getWidth(context) / 180,
                                      margin: EdgeInsets.only(
                                          left: getWidth(context) / 20,
                                          right: getWidth(context) / 20,
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              20),
                                      color: SpecificColors(context)
                                          .darkGreyLightGreyColor,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: getWidth(context) / 15.0),
                                      width: getWidth(context),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: getWidth(context) / 5.0,
                                            width: getWidth(context),
                                            child: CachedNetworkImage(
                                                fit: BoxFit.scaleDown,
                                                imageUrl: launchesObject
                                                        .rocketProviderLogo ??
                                                    launchesObject
                                                        .launchServiceProviderLogo),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: getWidth(context) / 15.0,
                                                bottom:
                                                    getWidth(context) / 15.0),
                                            child: Text(
                                              launchesObject.rocketProvider,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17.0),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              : null)
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
