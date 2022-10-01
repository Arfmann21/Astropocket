import 'dart:async';

import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/launch_state_parse.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/widgets/launches/specific/state_tab.dart';
import 'package:astropocket/ui/widgets/launches/specific/mission_tab.dart';
import 'package:astropocket/ui/widgets/launches/specific/rocket_tab.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

class SpecificLaunch extends StatefulWidget {
  final String heroTag;
  final String nameHeroTag;

  const SpecificLaunch({required this.heroTag, required this.nameHeroTag});

  @override
  _SpecificLaunchState createState() => _SpecificLaunchState();
}

class _SpecificLaunchState extends State<SpecificLaunch> {
  // On dispose, the timer must be cancelled
  @override
  void dispose() {

    if(mounted) timer!.cancel();
    super.dispose();
  }

  // The timer must work with intervals of 1 seconds
  static const duration = const Duration(seconds: 1);

  // Get the difference between the launch date and the current date, in seconds
  int timeDiff = DateTime.parse(launchesObject.launchDate.toString())
      .difference(DateTime.now())
      .inSeconds;

  // Timer object
  late Timer? timer;

  // Use this variable for the TabBar, to get which widget must be shown
  int selectedIndex = 0;

  // Mission & rocket description could be too long, check if those are expanded or not
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // The timer must start only if null: this will avoid a restart when calling a setState
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        // If the difference of the 2 dates is  > 0, then the launch is still to be launched
        if (timeDiff > 0) {
          setState(() {
            timeDiff -= 1;
          });
        } else {}
      });
    }

    // Calculate the time difference in days, hours, minutes and seconds
    int days = timeDiff ~/ (24 * 60 * 60);
    int hours = timeDiff ~/ (60 * 60) % 24;
    int minutes = (timeDiff ~/ 60) % 60;
    int seconds = timeDiff % 60;

    //The strings for the share, based on the status of the launch: the upcoming list could contain an already launched launch
    String shareUpcomingText =
        '🚀 The ${launchesObject.rocketName} from ${launchesObject.rocketProvider} will launch on ${LaunchDataParse(date: launchesObject.launchDate.toString()).dateParse()} for the mission ${launchesObject.missionName}!\n\n';
    String sharePreviousTextSuccess =
        '🚀 The ${launchesObject.rocketName} from ${launchesObject.rocketProvider} has been launched on ${LaunchDataParse(date: launchesObject.launchDate.toString()).dateParse()} for the mission ${launchesObject.missionName}!\n\n✅ Status: Successful\n\n';
    String sharePreviousTextFailure =
        '🚀 The ${launchesObject.rocketName} from ${launchesObject.rocketProvider} has been launched on ${LaunchDataParse(date: launchesObject.launchDate.toString()).dateParse()} for the mission ${launchesObject.missionName}!\n\n❌ Status: Failure\n\n';

    String sharePreviousTextPartialFailure =
        '🚀 The ${launchesObject.rocketName} from ${launchesObject.rocketProvider} has been launched on ${LaunchDataParse(date: launchesObject.launchDate.toString()).dateParse()} for the mission ${launchesObject.missionName}!\n\n❌ Status: Partial failure\n\n';

    // Use a DefaultTabController as root to avoid a second Scaffold
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
                    // Share string based on the state
                    switch (LaunchDataParse(state: launchesObject.state.toString())
                        .stateParse()) {
                      case 'Success':
                        await Share.share(sharePreviousTextSuccess);
                        break;

                      case 'Failure':
                        await Share.share(sharePreviousTextFailure);
                        break;

                      case 'Partial failure':
                      await Share.share(sharePreviousTextPartialFailure);
                      break;
                      // If not failure and success, then it's not launched yet
                      default:
                        await Share.share(shareUpcomingText);
                        break;
                    }
                  })
            ],
          ),
          body: SingleChildScrollView(
            // General padding
            child: Padding(
              padding: EdgeInsets.only(
                  top: getHeight(context) / 30.0,
                  left: getWidth(context) / 30.0,
                  right: getWidth(context) / 30.0),
              child: Column(
                children: [
                  // The container for the launch Image and the timer
                  Container(
                    height: getHeight(context) / 3.5,
                    width: getWidth(context),

                    // Use card to give an elevation
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(getWidth(context) / 36.0)),
                      child: Hero(
                        tag: widget.heroTag,

                        // This is used to give a BorderRadius to the image, otherwise the image override the card borderRadius
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(getWidth(context) / 36.0),

                          // There must be the timer over the image
                          child: Stack(
                            children: [
                              // Image
                              Container(
                                height: getHeight(context),
                                width: getWidth(context),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      launchesObject.launchImageUrl != null
                                          ? launchesObject.launchImageUrl
                                          : launchesObject
                                              .launchServiceProviderLogo,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) {
                                    return Container();
                                  },
                                ),
                              ),

                              // Timer
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: getHeight(context) / 13.0,
                                  width: getWidth(context),
                                  color: SpecificColors(context)
                                      .timerBackgroundColor,
                                  alignment: Alignment.center,
                                  // The hero animation, on start, will detach the child from the MaterialApp, so
                                  // if the child is a Text, it will be underlined: wrap it in a Material widget
                                  child: Material(
                                    // Transparent, otherwise it will have a background
                                    color: Colors.transparent,
                                    child: Text(
                                      LaunchDataParse(
                                                  state: launchesObject.state.toString())
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
                                          color: SpecificColors(context)
                                              .timerTextColor),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Launch name
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: getHeight(context) / 30.0,
                          bottom: getHeight(context) / 50.0),
                      child: Hero(
                        tag: widget.nameHeroTag,
                        // The hero animation, on start, will detach the child from the MaterialApp, so
                        // if the child is a Text, it will be underlined: wrap it in a Material widget
                        child: Material(
                          // Transparent, otherwise it will have a background
                          color: Colors.transparent,
                          child: SizedBox(
                            width: getWidth(context),
                            child: Text(
                              launchesObject.launchName.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 21.0, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Tab bar
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

                      // Use a custom indicator. This package gives a customization similiar to a container
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

                  /*
                  The tabs must be in a Column, so an Expanded is required for a TabView, but there is also a SingelChildScrollView
                  Those 4 widgets can't be used togheter , so I've created my own "TabView" with a stack and animated opacity.
                  The scroll animation is not possible this way, that's why I used an AnimatedOpacity
                   */
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      // First tab, which contain state and livesteam
                      SpecificLaunchStateTab(selectedIndex: selectedIndex),

                      // Second tab, which conatin mission details
                      SpecificLaunchMissionTab(
                        selectedIndex: selectedIndex,
                      ),

                      // Third tab, which contain rocket details
                      SpecificLaunchRocketTab(
                        selectedIndex: selectedIndex,
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
