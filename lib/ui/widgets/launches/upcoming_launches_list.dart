import 'package:astropocket/backend/api/launches_api.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/screens/specific_launch.dart';
import 'package:astropocket/ui/widgets/launches/too_many_requests.dart';
import 'package:astropocket/ui/widgets/launches/upcoming_state_date.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class UpcomingLaunchesList extends StatefulWidget {
  final type;

  UpcomingLaunchesList({this.type});

  @override
  _UpcomingLaunchesListState createState() => _UpcomingLaunchesListState();
}

class _UpcomingLaunchesListState extends State<UpcomingLaunchesList> {
  Future<LaunchesApi> futureLaunches;

  @override
  void initState() {
    if (fetchedUpcomingLaunches == null)
      fetchedUpcomingLaunches = fetchLaunches(widget.type, false, null);
    super.initState();
  }

  // Set a global object to use for specific launch infos. This method will be called when the user tap on a launch
  void setLaunchesObject(snapshot, index) {
    launchesObject = LaunchesApi(
      state: snapshot.data.general[index]['status']['name'],
      launchImageUrl: snapshot.data.general[index]['image'],
      launchDate: snapshot.data.general[index]['window_start'],
      launchName: snapshot.data.general[index]['name'],

      // Sometimes, the live is not avaible
      liveUrl:
          snapshot.data.general[index]['vidURLs'].toString().contains('url')
              ? snapshot.data.general[index]['vidURLs'][0]['url']
              : 'No video avaibles',

      // Sometimes, mission name and description is not avaible
      missionDescription: snapshot.data.general[index]['mission'] != null
          ? snapshot.data.general[index]['mission']['description']
          : snapshot.data.general[index]['launch_service_provider']['name'] +
              ' didn\'t provide mission details',
      missionName: snapshot.data.general[index]['mission'] != null
          ? snapshot.data.general[index]['mission']['name']
          : 'Mission details unavaibles',

      // Launch agency name and logo
      launchServiceProvider: snapshot.data.general[index]
          ['launch_service_provider']['name'],
      launchServiceProviderLogo: snapshot.data.general[index]
          ['launch_service_provider']['logo_url'],

      // Rocket name, description and provider name and logo
      rocketName: snapshot.data.general[index]['rocket']['configuration']
          ['full_name'],
      rocketDescription: snapshot.data.general[index]['rocket']['configuration']
          ['description'],
      rocketProvider: snapshot.data.general[index]['rocket']['configuration']
          ['manufacturer']['name'],
      rocketProviderLogo: snapshot.data.general[index]['rocket']
          ['configuration']['manufacturer']['logo_url'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LaunchesApi>(
      future: fetchedUpcomingLaunches,
      builder: (context, snapshot) {
        // The API, as every HTTP(s) request, takes times to load
        if (snapshot.connectionState == ConnectionState.done) {
          // The snapshot could be without data, for some kind of bug / error
          if (snapshot.hasData) {
            return ListView.builder(
                // Keep loaded items in ListView loaded, if not specified is set to false
                addAutomaticKeepAlives: true,

                // There are much more than 100 upcoming launches (usually) but the API have max 100 launches per page
                itemCount: 100,
                itemBuilder: (builder, index) {
                  // General padding for each item. With the bottom one, the ListView.separator() can be avoided (in this case, at least)
                  return Padding(
                    padding: EdgeInsets.only(
                        left: getWidth(context) / 36.0,
                        right: getWidth(context) / 36.0,
                        top: getHeight(context) / 30.0,
                        bottom: getHeight(context) / 30.0),

                    // The tap must be detected on the whole item container
                    child: GestureDetector(
                      onTap: () {
                        // Set a global object to use for specific launch infos
                        setLaunchesObject(snapshot, index);

                        // The Hero tag is dynamic, based on the index
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SpecificLaunch(
                                      heroTag: 'imageHero$index',
                                      nameHeroTag: 'launchNameHero$index',
                                    )));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(getWidth(context) / 36.0),
                        ),
                        child: Column(
                          children: [
                            Hero(
                              tag: 'imageHero$index',

                              // Set the borderRadius again for the imgae due to the Hero animation
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    getWidth(context) / 36.0),

                                // Doesn't matter the size of the image, the containers must be symmetrical
                                child: Container(
                                    height: getHeight(context) / 3.5,
                                    width: getWidth(context),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      // Sometimes, there's no image: in this case, show the launch provider logo
                                      // If also the logo is unavaible, show a text
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

                            // Widget for the launch name
                            Padding(
                              padding: EdgeInsets.only(
                                  top: getWidth(context) / 20.0,
                                  bottom: getWidth(context) / 36.0),
                              child: Hero(
                                tag: 'launchNameHero$index',
                                // The hero animation, on start, will detach the child from the MaterialApp, so
                                // if the child is a Text, it will be underlined: wrap it in a Material widget
                                child: Material(
                                  // Transparent, otherwise it will have a background
                                  color: Colors.transparent,

                                  // Specify width to avoid the Hero bug with the Text.
                                  // Its a well known bug, but it still not fixed
                                  child: Container(
                                    width: getWidth(context),
                                    child: Text(
                                      snapshot.data.general[index]['name'],
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17.0),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            /*Pass the index and the snapshot to the class, because otherwise it would be not
                             possible to  create the widget for each list item*/
                            LaunchesListStateDateWidget(
                              index: index,
                              snapshot: snapshot,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            // The API have a limit of 300 requests per day, if this limit is exceeded,  show the appropiate widgets
            return TooManyRequests();
          }
        } else

          // Show a loading list waiting for the API results
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
    );
  }
}
