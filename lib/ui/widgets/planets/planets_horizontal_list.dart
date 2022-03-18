import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/planets_infos.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/screens/explore_planets.dart';
import 'package:flutter/material.dart';

class PlanetsHorizontalList extends StatelessWidget {
  final List<String> arrayCardText;
  final List<String> arrayCardSubtitleText;
  final String headerText;
  final index;

  PlanetsHorizontalList(
      {this.arrayCardText,
      this.arrayCardSubtitleText,
      this.headerText,
      this.index,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ExplorePlanets(
                      planetName: arrayCardText[index],
                      planetSubtitle: arrayCardSubtitleText[index],
                      heroTag: arrayCardText[index].toString().toLowerCase(),
                      majorMoons: PlanetsInfos().getMajorMoons(index),
                      facts: PlanetsInfos().getPlanetFacts(index),
                      factsTitle: PlanetsInfos().getPlanetFactsTitle(index)
                    )));
      },
      child: Container(
        width: getWidth(context) / 2,
        child: Stack(
          children: [
            // Use a general Container to set size of each Card
            Container(
              height: getHeight(context) / 4,
              width: getWidth(context),
              margin: EdgeInsets.only(
                top: getHeight(context) / 20,
              ),

              // Card for title, subtitle and arrow icon
              child: Card(
                  elevation: 10,
                  color: SpecificColors(context).exploreCardColor,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(getWidth(context) / 36.0)),

                  //  Title, subtitle and arrow Padding
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: getHeight(context) / 10,
                        left: getWidth(context) / 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          arrayCardText[index],
                          style: TextStyle(
                              color: Color(0xFFE6E6E6),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),

                        // Subtitle
                        Text(
                          arrayCardSubtitleText[index],
                          style: TextStyle(
                              color: Color(0xFFD1B13F),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),

                        // Icon
                        Padding(
                          padding: EdgeInsets.only(top: getWidth(context) / 30),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Color(0xFFE6E6E6),
                          ),
                        )
                      ],
                    ),
                  )),
            ),

            // Top image
            Container(
              height: getWidth(context) / 3.5,
              width: getWidth(context),
              alignment: Alignment.topCenter,
              child: Hero(
                tag: arrayCardText[index].toLowerCase() + 'Hero',
                child: Image.asset(
                    'assets/images/${headerText.toLowerCase()}/${arrayCardText[index].toLowerCase()}.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
