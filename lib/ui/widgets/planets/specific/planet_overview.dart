// This class is used to display planet overview in ExplorePlanets

import 'package:astropocket/backend/distance_unit_parser.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/planets_infos.dart';
import 'package:flutter/material.dart';

class PlanetOverview extends StatelessWidget {

  final planetName;

  PlanetOverview({this.planetName});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: getWidth(context) / 36.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                            color: Color(0xFFD58235),
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                     /* IconButton(
                        icon: Icon(ExpandCustomIcon.arrow_expand),
                        onPressed: () {
                        },
                      )*/
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: getHeight(context) / 50,
                    left: getWidth(context) / 36,
                    right: getWidth(context) / 36),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Type',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFD58235),
                                fontSize: 16),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: getWidth(context) / 70),
                            child: Text(
                              PlanetsInfos().getInfos(planetName)[0],
                              style: TextStyle(
                                  fontSize: 15.5, fontWeight: FontWeight.w600,),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: getWidth(context) / 20.0),
                            child: Text(
                              'From Sun',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFD58235),
                                  fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: getWidth(context) / 70),
                            child: Text(
                              DistanceUnitParsing(
                                      distance: double.parse(PlanetsInfos()
                                          .getInfos(planetName)[1]))
                                  .getParsedDistance(),
                              style: TextStyle(
                                  fontSize: 15.5, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Year lenght',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFD58235),
                                fontSize: 16),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: getWidth(context) / 70),
                            child: Text(
                              PlanetsInfos().getInfos(planetName)[2],
                              style: TextStyle(
                                  fontSize: 15.5, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: getWidth(context) / 20.0),
                            child: Text(
                              'Day length',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFD58235),
                                  fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(top: getWidth(context) / 70),
                            child: Text(
                              PlanetsInfos().getInfos(planetName)[3],
                              style: TextStyle(
                                  fontSize: 15.5, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}