import 'package:astropocket/backend/api/nasa_apod.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/custom_icons/expand_icon_icons.dart';
import 'package:astropocket/ui/screens/picture_of_day.dart';
import 'package:astropocket/ui/widgets/home/picture_day/picture_container_home.dart';
import 'package:astropocket/ui/widgets/home/picture_day/picture_day_content_home.dart';
import 'package:astropocket/ui/widgets/home/picture_day/picture_day_skeleton_home.dart';
import 'package:astropocket/ui/widgets/home/picture_day/video_container.dart';
import 'package:astropocket/ui/widgets/launches/too_many_requests.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PictureDayHomeWidget extends StatefulWidget {
  @override
  _PictureDayHomeWidgetState createState() => _PictureDayHomeWidgetState();
}

class _PictureDayHomeWidgetState extends State<PictureDayHomeWidget> {
  Future<ApodApi> futureApod;

  @override
  void initState() {
    super.initState();
    futureApod = fetchApod();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApodApi>(
        future: futureApod,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            
            if (snapshot.hasData) {

              // Create the object to use for the Picture of the day section to avoid another request
              apodObject = ApodApi(
                title: snapshot.data.title,
                explanation: snapshot.data.explanation,
                hdurl: snapshot.data.hdurl,
                type: snapshot.data.type,
                copyright: snapshot.data.copyright,
              );

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: 'apodTextHero',
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: getWidth(context) / 1.5,
                            child: Text(
                              'Picture of the day',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                fontSize: 21.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Hero(
                          tag: 'apodShareHero',
                          child: Icon(
                            ExpandCustomIcon.arrow_expand,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PictureOfTheDay()));
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  snapshot.data.type == 'video'
                      ? VideoContainer()
                      : PictureContainerHome(),
                  PictureDayContentHome()
                ],
              );
            } else
              return RequestError();
          } else

          // If it's still loading, remove the Expand icon button to avoid bugs and errors
            return Container(
              padding: EdgeInsets.only(top: getWidth(context) / 36.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Picture of the day',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 21.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),

                  // The actual loading skeleton
                  PictureDaySkeletonHome()
                ],
              ),
            );
        });
  }
}
//
