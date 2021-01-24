import 'package:astropocket/backend/api/launches_api.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/custom_icons/previous_icon_icons.dart';
import 'package:astropocket/style/custom_icons/upcoming_icon_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/screens/specific_launch.dart';
import 'package:astropocket/ui/widgets/launches/upcoming_state_date.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
            if (snapshot.hasData) {
              return ListView.builder(
                  addAutomaticKeepAlives: true,
                  itemCount: 100,
                  itemBuilder: (builder, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: getWidth(context) / 36.0,
                          right: getWidth(context) / 36.0,
                          top: getHeight(context) / 30.0,
                          bottom: getHeight(context) / 30.0),
                      child: GestureDetector(
                        onTap: () {
                          launchesObject = LaunchesApi(
                            state: snapshot.data.general[index]['status']
                                ['name'],
                            launchImageUrl: snapshot.data.general[index]
                                ['image'],
                            launchDate: snapshot.data.general[index]
                                ['window_start'],
                            launchName: snapshot.data.general[index]['name'],
                            liveUrl: snapshot.data.general[index]['vidURLs']
                                    .toString()
                                    .contains('url')
                                ? snapshot.data.general[index]['vidURLs'][0]
                                    ['url']
                                : 'No video avaibles',
                            missionDescription:
                                snapshot.data.general[index]['mission'] != null
                                    ? snapshot.data.general[index]['mission']
                                        ['description']
                                    : 'Mission details unavaibles',
                            missionName:
                                snapshot.data.general[index]['mission'] != null
                                    ? snapshot.data.general[index]['mission']
                                        ['name']
                                    : 'Mission details unavaibles',
                            launchServiceProvider: snapshot.data.general[index]
                                ['launch_service_provider']['name'],
                            launchServiceProviderLogo:
                                snapshot.data.general[index]
                                    ['launch_service_provider']['logo_url'],
                            rocketName: snapshot.data.general[index]['rocket']
                                ['configuration']['full_name'],
                            rocketDescription: snapshot.data.general[index]
                                ['rocket']['configuration']['description'],
                            rocketProvider: snapshot.data.general[index]
                                    ['rocket']['configuration']['manufacturer']
                                ['name'],
                            rocketProviderLogo: snapshot.data.general[index]
                                    ['rocket']['configuration']['manufacturer']
                                ['logo_url'],
                          );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SpecificLaunch(
                                        heroTag: 'imageHero$index',
                                      )));
                        },
                        child: Container(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  getWidth(context) / 36.0),
                            ),
                            child: Column(
                              children: [
                                Hero(
                                  tag: 'imageHero$index',
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        getWidth(context) / 36.0),
                                    child: Container(
                                        height: getHeight(context) / 3.5,
                                        width: getWidth(context),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: snapshot.data.general[index]
                                                      ['image'] !=
                                                  null
                                              ? snapshot.data.general[index]
                                                  ['image']
                                              : snapshot.data.general[index][
                                                          'launch_service_provider']
                                                      ['logo_url'] ??
                                                  'Image unavaible',
                                          placeholder: (context, url) {
                                            return Container();
                                          },
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: getWidth(context) / 20.0,
                                      bottom: getWidth(context) / 36.0),
                                  child: Hero(
                                    tag: 'launchNameHero$index',
                                    child: Text(
                                      snapshot.data.general[index]['name'],
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                StatefulBuilder(
                                  builder: (context, _) {
                                    return UpcomingLaunchStateDateWidget(
                                      index: index,
                                      snapshot: snapshot,
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Padding(
                    padding: EdgeInsets.only(top: getHeight(context) / 20.0),
                    child: Column(children: [
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
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(getWidth(context) / 36.0),
                      child: Skeleton(
                        baseColor: SpecificColors(context).pulseColorBase,
                        // The Highlight color is the same for both white and dark theme
                        hightlightColor: const Color(0xFF053361),
                      ),
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
