import 'package:astropocket/backend/api/spaceflight.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/url_launcher.dart';
import 'package:astropocket/style/custom_icons/expand_icon_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/screens/news.dart';
import 'package:astropocket/ui/widgets/home/news/news_skeleton_home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton_animation/skeleton_animation.dart';

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  Future<NewsApi> futureNews;

  @override
  void initState() {
    futureNews = fetchNews(true, 'articles');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text and Expand icon button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: 'newsHero',
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: getWidth(context) / 1.5,
                  child: Text(
                    'News',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(ExpandCustomIcon.arrow_expand,
                  ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => News()));
              },
            )
          ],
        ),
        SizedBox(
          height: 5.0,
        ),

        // Actually News container
        Container(
            height: getHeight(context) / 5,
            child: FutureBuilder<NewsApi>(
                future: futureNews,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return NewsSkeletonHome();
                  else {
                    if (snapshot.hasData) {
                      // If the user click on the News container, the browser will open to see the news on its website
                      return GestureDetector(
                        onTap: () {
                          launchURL(snapshot.data.url);
                        },
                        // Use card for the elevation
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          // Row for news picture and news title
                          child: Row(
                            children: [
                              // News picture
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: getWidth(context) / 24.0),
                                  // Use ClipRRect to set borderRadius to picture
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    //Picture container
                                    child: Container(
                                      height: getWidth(context) / 3.6,
                                      width: getWidth(context) / 3.6,
                                      // Use CachedNetworkImgae to show a loading animation (or screen) when getitng picture from the internet
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: snapshot.data.thumbnail,
                                        placeholder: (context, url) {
                                          return Skeleton(
                                            height: getWidth(context) / 3.6,
                                            width: getWidth(context) / 3.6,
                                            baseColor: SpecificColors(context)
                                                .pulseColorBase,
                                            // The Highlight color is the same for both white and dark theme
                                            hightlightColor:
                                                const Color(0xFF053361),
                                          );
                                        },
                                      ),
                                    ),
                                  )),

                              // News title
                              Container(
                                width: getWidth(context) / 2.1,
                                margin: EdgeInsets.only(
                                    left: getWidth(context) / 24.0),
                                child: Text(
                                  snapshot.data.title,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.5),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    } else
                      return Text(snapshot.toString());
                  }
                }))
      ],
    );
  }
}
