import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/ui/widgets/explore/explore_horizontal_list.dart';
import 'package:astropocket/ui/widgets/explore/explore_overview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreHome extends StatelessWidget {
  final String title;
  final headerText;
  final List<String> arrayCardText;
  final List<String> arrayCardSubtitleText;
  final overviewDescription;

  ExploreHome(
      {this.title,
      this.headerText,
      this.arrayCardText,
      this.overviewDescription,
      this.arrayCardSubtitleText});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              title,
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 22.0),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: getHeight(context) / 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: getWidth(context) / 20),
                    child: Text(
                      headerText,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 23.0),
                    ),
                  ),
                  Container(
                    height: getWidth(context) / 1.5,
                    width: getWidth(context),
                    margin: EdgeInsets.only(top: getHeight(context) / 80.0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: getWidth(context) / 15,
                        );
                      },
                      padding: EdgeInsets.only(
                          left: getWidth(context) / 36.0,
                          right: getWidth(context) / 36.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: arrayCardText.length,
                      itemBuilder: (context, index) {
                        return ExploreHorizontalList(
                          arrayCardText: arrayCardText,
                          arrayCardSubtitleText: arrayCardSubtitleText,
                          headerText: headerText,
                          index: index,
                        );
                      },
                    ),
                  ),
                  ExploreOverview(
                    title: title,
                    overviewDescription: overviewDescription,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
