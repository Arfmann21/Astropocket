import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanetFacts extends StatefulWidget {
  final List<String> facts;
  final List<String> factsTitle;

  PlanetFacts({this.facts, this.factsTitle});

  @override
  _PlanetFactsState createState() => _PlanetFactsState();
}

class _PlanetFactsState extends State<PlanetFacts> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: getWidth(context) / 36.0),
          child: Text(
            'Facts',
            style: TextStyle(
                color: Color(0xFFD58235),
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: getHeight(context) / 25.0),
            child: CarouselSlider.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) =>
                    Container(
                      width: getWidth(context),
                      padding:
                          EdgeInsets.only(bottom: getHeight(context) / 36.0),
                      child: Card(
                          elevation: 7,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  getWidth(context) / 36.0)),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: getWidth(context) / 20.0,
                              right: getWidth(context) / 20.0,
                              top: getWidth(context) / 20.0,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: getWidth(context) / 9.0,
                                      width: getWidth(context) / 9.0,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            getHeight(context)),
                                        color: Color(0xFFD58235),
                                      ),
                                      child: Text(
                                        (itemIndex + 1).toString(),
                                        style: GoogleFonts.poppins(
                                            fontSize: 18.0,
                                            color: SpecificColors(context)
                                                .backgroundAsCardColor),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: getWidth(context) / 20.0),
                                      child: Text(
                                        widget.factsTitle[itemIndex],
                                        style: GoogleFonts.poppins(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: getWidth(context) / 20.0),
                                  child: Text(
                                    widget.facts[itemIndex],
                                    maxLines: isExpanded ? 150 : 10,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.normal,
                                      color: SpecificColors(context)
                                          .secondaryTextColor,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ),
                                widget.facts[itemIndex].length > 400
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isExpanded = !isExpanded;
                                          });
                                        },
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top: getWidth(context) / 20.0),
                                            child: Text(
                                              isExpanded ? 'Less' : 'Read more',
                                              style: GoogleFonts.poppins(
                                                  color: SpecificColors(context)
                                                      .indicatorColor),
                                            )),
                                      )
                                    : Container()
                              ],
                            ),
                          )),
                    ),
                options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: isExpanded
                        ? getHeight(context) / 1.2
                        : getHeight(context) / 2.0,
                    onPageChanged: (index, onChange) => {
                          if(isExpanded) setState(() {
                              isExpanded = false;
                          })
                        },
                    viewportFraction: 0.9))),


      ],
    );
  }
}
