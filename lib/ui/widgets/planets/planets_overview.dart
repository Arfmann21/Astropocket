import 'package:astropocket/backend/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanetsOverview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getWidth(context) / 20,
          right: getWidth(context) / 20,
          top: getHeight(context) / 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 23.0),
          ),
          Container(
            margin: EdgeInsets.only(top: getHeight(context) / 80.0),
            width: getWidth(context),
            height: getHeight(context) / 4,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(getWidth(context) / 36)),
              child: Image.asset(
                'assets/images/planets/solar_system.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getHeight(context) / 60,
                bottom: getHeight(context) / 50,
                left: getWidth(context) / 36.0,
                right: getWidth(context) / 36.0),
            child: Text(
              'Our solar system consists of our star, the Sun, and everything bound to it by gravity — the planets Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus and Neptune, dwarf planets such as Pluto, dozens of moons and millions of asteroids, comets and meteoroids. Beyond our own solar system, we have discovered thousands of planetary systems orbiting other stars in the Milky Way.',
              style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
