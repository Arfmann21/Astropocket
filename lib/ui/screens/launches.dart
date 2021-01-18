import 'package:astropocket/backend/api/launches_api.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/launch_state_parse.dart';
import 'package:astropocket/style/custom_icons/previous_icon_icons.dart';
import 'package:astropocket/style/custom_icons/upcoming_icon_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class Launches extends StatefulWidget {
  @override
  _LaunchesState createState() => _LaunchesState();
}

class _LaunchesState extends State<Launches> {
  Future<LaunchesApi> futureLaunches;

  @override
  void initState() {
    futureLaunches = fetchLaunches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Upcoming',
            icon: Icon(UpcomingIcon.page_next_outline),
          ),
          BottomNavigationBarItem(
            label: 'Previous',
            icon: Icon(PreviousIcon.backburger),
          )
        ],
      ),
      appBar: AppBar(
        title: Text(
          'Launches',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search_outlined,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: FutureBuilder<LaunchesApi>(
        future: futureLaunches,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final ThemeData currentTheme = Theme.of(context);

            if (snapshot.hasData) {
              return ListView.builder(
                  addAutomaticKeepAlives: true,
                  addSemanticIndexes: true,
                  itemCount: 178,
                  itemBuilder: (builder, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: getWidth(context) / 36.0,
                          right: getWidth(context) / 36.0,
                          top: getHeight(context) / 30.0,
                          bottom: getHeight(context) / 30.0),
                      child: Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(getWidth(context) / 36.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: getHeight(context) / 3.5,
                                width: getWidth(context),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: snapshot.data.general[index]
                                      ['image'],
                                  placeholder: (context, url) {
                                    return Container();
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: getWidth(context) / 20.0,
                                    bottom: getWidth(context) / 36.0),
                                child: Text(
                                  snapshot.data.general[index]['name'],
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: getHeight(context) / 30.0,
                                        left: getWidth(context) / 20.0,
                                        right: getWidth(context) / 20.0,
                                        bottom: getWidth(context) / 15.0),
                                    child: Container(
                                      height: getHeight(context) / 7.0,
                                      width: getWidth(context),
                                      padding: EdgeInsets.only(
                                          bottom: getWidth(context) / 30.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              getWidth(context) / 36.0),
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0xFFD58235),
                                          )),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: getWidth(context) / 20.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              LaunchDataParse(
                                                      date: snapshot.data
                                                              .general[index]
                                                          ['window_start'])
                                                  .dateParse(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16.0),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top:
                                                      getWidth(context) / 36.0),
                                              child: CountdownFormatted(
                                                duration: Duration(
                                                    milliseconds:
                                                        DateTime.parse(snapshot
                                                                        .data
                                                                        .general[
                                                                    index][
                                                                'window_start'])
                                                            .difference(
                                                                DateTime.now())
                                                            .inMilliseconds),
                                                builder:
                                                    (context, remainingTime) {
                                                  return Text(
                                                    DateTime.parse(snapshot.data.general[index]['window_start'])
                                                                .difference(
                                                                    DateTime
                                                                        .now())
                                                                .inMilliseconds <=
                                                            0
                                                        ? 'Launched'
                                                        : (int.parse(remainingTime.substring(0, 2)) <
                                                                        24
                                                                    ? 0
                                                                    : int.parse(remainingTime.substring(0, 2)) ~/
                                                                        24)
                                                                .toString() +
                                                            'dd ' +
                                                            (int.parse(remainingTime.substring(0, 2)) <
                                                                        24
                                                                    ? int.parse(
                                                                        remainingTime.substring(0, 2))
                                                                    : int.parse(remainingTime.substring(0, 2)) - 24)
                                                                .toString() +
                                                            'h ' +
                                                            remainingTime.substring(4, 5) +
                                                            'm ' +
                                                            remainingTime.substring(6) +
                                                            's',
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 20.0),
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      width: getWidth(context) / 2.0,
                                      height: getWidth(context) / 10.0,
                                      color: currentTheme.brightness ==
                                              Brightness.light
                                          ? Color(0xFFFFFFFF)
                                          : Color(0xFF1c3046),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: getHeight(context) / 60.0,
                                    ),
                                    child: Center(
                                      child: Text(
                                        LaunchDataParse(
                                                state:
                                                    snapshot.data.general[index]
                                                        ['status']['name'])
                                            .stateParse(),
                                        style: GoogleFonts.poppins(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF1FD246)),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                              child: Padding(
                    padding: EdgeInsets.only(top: getHeight(context) / 20.0),
                    child: Column(
                      children: [
                      Container(
                          height: getHeight(context) / 6.22,
                          margin:
                              EdgeInsets.only(top: getHeight(context) / 11.6),
                          child:
                              Image.asset('assets/images/no_connection.png')),
                      Padding(
                        padding: EdgeInsets.only(
                            top: getHeight(context) / 31.1,
                            left: getWidth(context) / 18.0,
                            right: getWidth(context) / 18.0),
                        child: Text(
                          'Seems like we did too many request',
                          style: GoogleFonts.poppins(
                              fontSize: 17.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                        child: Text(
                          'Try again later ',
                          style: GoogleFonts.poppins(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: SpecificColors(context)
                                  .darkGreyLightGreyColor),
                        ),
                      ),
                    ])),
              );
            }
          } else
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: getHeight(context) / 30.0,
                      left: getWidth(context) / 20.0,
                      right: getWidth(context) / 20.0,
                      bottom: getWidth(context) / 15.0),
                  child: Container(
                    height: getHeight(context) / 2.5,
                    width: getWidth(context),
                    child: Skeleton(
                      baseColor: SpecificColors(context).pulseColorBase,
                      // The Highlight color is the same for both white and dark theme
                      hightlightColor: const Color(0xFF053361),
                    ),
                  ),
                );
              },
            );
        },
      ),
    );
  }
}
