import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MajorMoonsList extends StatelessWidget {
  final List<String> majorMoons;
  final String planetName;

  MajorMoonsList({this.majorMoons, this.planetName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: getWidth(context) / 36.0),
          child: Text(
            'Major Moons',
            style: TextStyle(
                color: Color(0xFFD58235),
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: getWidth(context) / 36.0, top: getHeight(context) / 25.0, right: getWidth(context) / 36.0),
          child: majorMoons != null
              ? Container(
                  alignment: Alignment.centerLeft,
                  height: getHeight(context) / 3.5,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          width: getWidth(context) / 2,
                          child: Stack(
                            children: [
                              // Use a general Container to set size of each Card
                              Container(
                                height: getHeight(context) / 5,
                                width: getWidth(context),
                                margin: EdgeInsets.only(
                                  top: getHeight(context) / 20,
                                ),

                                // Card for title, subtitle and arrow icon
                                child: Card(
                                    elevation: 10,
                                    color: SpecificColors(context)
                                        .exploreCardColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            getWidth(context) / 36.0)),

                                    //  Title, subtitle and arrow Padding
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: getHeight(context) / 10,
                                          left: getWidth(context) / 20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Title
                                          Text(
                                            majorMoons[index],
                                            style: TextStyle(
                                                color: Color(0xFFE6E6E6),
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),

                                          // Subtitle
                                        ],
                                      ),
                                    )),
                              ),

                              // Top image
                              Container(
                                height: getWidth(context) / 3.5,
                                width: getWidth(context),
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                    'assets/images/moons/${planetName.toLowerCase()}/${majorMoons[index].toLowerCase()}.png'),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: getWidth(context) / 15,
                        );
                      },
                      itemCount: majorMoons.length),
                )
              : Text(
                  planetName + " has no major Moons",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0,
                  ),
                ),
        )
      ],
    );
  }
}
