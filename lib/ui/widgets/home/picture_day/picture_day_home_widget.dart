import 'package:astropocket/backend/api/nasa_apod.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/custom_icons/expand_icon_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/screens/picture_of_day.dart';
import 'package:astropocket/ui/widgets/home/picture_day/picture_container_home.dart';
import 'package:astropocket/ui/widgets/home/picture_day/picture_day_content_home.dart';
import 'package:astropocket/ui/widgets/home/picture_day/picture_day_skeleton_home.dart';
import 'package:astropocket/ui/widgets/home/picture_day/video_container.dart';
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
                                fontWeight: FontWeight.w600,
                                fontSize: 22.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Hero(
                          tag: 'apodShareHero',
                          child: Icon(ExpandCustomIcon.arrow_expand,
                              color:
                                  SpecificColors(context).blackWhiteTextColor),
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
                    height: 5.0,
                  ),
                  snapshot.data.type == 'video'
                      ? VideoContainer()
                      : PictureContainerHome(),
                      PictureDayContentHome()
                ],
              );
            } else
              return Text(snapshot.error.toString());
          } else
            return Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Picture of the day',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                PictureDaySkeletonHome()
              ],
            );
        });
  }
}
//
