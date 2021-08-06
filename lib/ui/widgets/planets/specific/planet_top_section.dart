// This class is used to display top section of ExplorePlanets, which includes name, subtitle and image of the specific planet

import 'package:astropocket/backend/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanetTopSection extends StatelessWidget {

  final planetName;
  final planetSubtitle;
  final heroTag;

  PlanetTopSection({this.planetName, this.planetSubtitle, this.heroTag});
  
  @override
  Widget build(BuildContext context) {
    return Stack(
                children: [
                  Transform(
                    transform: Matrix4.translationValues(
                        -(getWidth(context) / 2.5), 0.0, 0.0),
                    child: Container(
                      height: getHeight(context) / 2.5,
                      width: getWidth(context),
                      child: Stack(
                        children: [
                          Hero(
                            tag: heroTag + 'Hero',
                            child: Image.asset(
                              'assets/images/planets/${planetName.toLowerCase()}.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: getHeight(context) / 7,
                        left: getWidth(context) / 2.5),
                    child: Column(
                      children: [
                        Text(
                          planetName.toUpperCase(),
                          style: GoogleFonts.poppins(
                              fontSize: 35, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          planetSubtitle,
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Color(0xFFD58235),
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
                ],
              );
  }
}