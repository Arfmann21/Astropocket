import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/url_launcher.dart';
import 'package:astropocket/style/custom_icons/expand_icon_icons.dart';
import 'package:astropocket/style/custom_icons/github_icon_icons.dart';
import 'package:astropocket/style/custom_icons/instagram_icon_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoSection extends StatefulWidget {
  @override
  _InfoSectionState createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  //bool isExpanded = false;
  String grapheionGithubLink = "https://github.com/Grapheion";
  String grapheionInstagramLink = "https://www.instagram.com/grapheion/";
  String projectGithubLink = "https://github.com/Grapheion/Astropocket/";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: getHeight(context) / 7.0,
            width: getHeight(context) / 7.0,
            child: Card(
              color: Colors.transparent,
              child: Image.asset("assets/images/logo.png"),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(getWidth(context) / 25.0)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: getHeight(context) / 30.0),
          child: Text(
            'Astropocket v$appVersion',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 17.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: getHeight(context) / 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Made by Grapheion',
                style: GoogleFonts.poppins(
                    fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(InstagramIcon.instagram),
                    onPressed: () {
                      launchURL(grapheionInstagramLink);
                    },
                  ),
                  IconButton(
                    icon: Icon(GithubIcon.github),
                    onPressed: () {
                      launchURL(grapheionGithubLink);
                    },
                  )
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Open source',
              style: GoogleFonts.poppins(
                  fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
            IconButton(
              icon: Icon(GithubIcon.github),
              onPressed: () {
                launchURL(projectGithubLink);
              },
            )
          ],
        ),

        // A paid version of the app will be avaible. (only to support the project, features will be the same)
        /*Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Support the project',
              style: GoogleFonts.poppins(
                  fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
            Transform.rotate(
              alignment: Alignment.center,
              angle: isExpanded ? 180 * 3.14 / 180 : 0,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: SpecificColors(context).primaryTextColor,
                ),
                iconSize: 32.0,
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
            ),
          ],
        ),
        Visibility(
          visible: isExpanded,
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text:
                      'Astropocket is totally free, without In-App purchases and ad, reason why there are some limits, like the amount of requests to services in a certain amount of time.\n\nWith your support, we can remove those limits: if you want, you can do it buying the paid version from ',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      color: SpecificColors(context).secondaryTextColor)),
              TextSpan(
                  text: 'here',
                  recognizer: TapGestureRecognizer()..onTap = () {
                    launch('https://play.google.com/store');
                  },
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      fontSize: 15.0,
                      color: Colors.blue[700]))
            ]),
          ),
        ),*/
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Credits',
              style: GoogleFonts.poppins(
                  fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
            IconButton(
              icon: Icon(ExpandCustomIcon.arrow_expand),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: SpecificColors(context).backgroundColorAsScaffold,
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(getWidth(context) / 36.0)),
                    builder: (context) {
                      return Container(
                        height: getHeight(context),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: getHeight(context) / 30.0,
                              left: getWidth(context) / 30.0,
                              right: getWidth(context) / 30.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: getHeight(context) / 60.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: getWidth(context) / 30.0),
                                        child: Icon(Icons.api_outlined),
                                      ),
                                      Text(
                                        'API',
                                        style: GoogleFonts.poppins(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'News by Spaceflight API',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.web_outlined),
                                        onPressed: () {
                                          launchURL(
                                              "https://spaceflightnewsapi.net/");
                                        })
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Reports by Spaceflight API',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.web_outlined),
                                        onPressed: () {
                                          launchURL(
                                              "https://spaceflightnewsapi.net/");
                                        })
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Launches by Launch Library 2',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.web_outlined),
                                        onPressed: () {
                                          launchURL(
                                              "https://thespacedevs.com/llapi");
                                        })
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Picture of the day by NASA',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.web_outlined),
                                        onPressed: () {
                                          launchURL("https://api.nasa.gov/");
                                        })
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'InSight Weather by NASA',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.web_outlined),
                                        onPressed: () {
                                          launchURL("https://api.nasa.gov/");
                                        })
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: getHeight(context) / 30.0,
                                      bottom: getHeight(context) / 60.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: getWidth(context) / 36.0),
                                        child: Icon(Icons.photo_filter_sharp),
                                      ),
                                      Text(
                                        'Resources',
                                        style: GoogleFonts.poppins(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Illustrations by Icons8',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                        icon: Icon(Icons.web_outlined),
                                        onPressed: () {
                                          launchURL("https://icons8.com/");
                                        })
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: getWidth(context) / 36.0),
        )
      ],
    );
  }
}
