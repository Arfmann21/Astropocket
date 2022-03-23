import 'package:astropocket/backend/drawer_builder.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerHome extends StatefulWidget {
  @override
  _DrawerHomeState createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  @override
  void initState() {
    connectionNotifier.addListener(() {
      if (this.mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              top: getHeight(context) / 9.5,
              left: getWidth(context) / 20.0,
              bottom: getWidth(context) / 36.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Application logo
                Container(
                  height: 100,
                  width: 100,
                  child: Card(
                    color: Colors.transparent,
                    child: Image.asset("assets/images/logo.png"),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(getWidth(context) / 25.0)),
                  ),
                ),

                Visibility(
                  visible: connectionNotifier.getAvailability(),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: getWidth(context) / 10.0),
                            child: Text(DrawerBuilder().sectionTitles[i],
                                style: GoogleFonts.poppins(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600)),
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: i < 2 ? 3 : 1,
                            itemBuilder: (context, j) {
                              
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: getWidth(context) / 15.0),
                                child: GestureDetector(
                                  onTap: () {
                                   DrawerBuilder().goToRoute(context, i, j);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        DrawerBuilder().iconsList[i][j],
                                        color: SpecificColors(context)
                                            .secondaryTextColor,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: getWidth(context) / 36.0),
                                        child: Text(
                                          DrawerBuilder().sectionNames[i][j],
                                          style: GoogleFonts.poppins(
                                              fontSize: 15.5,
                                              fontWeight: FontWeight.w400,
                                              color: SpecificColors(context)
                                                  .secondaryTextColor),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
