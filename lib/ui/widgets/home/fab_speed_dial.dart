import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/planets_infos.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/screens/explore_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class FabSpeedDial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      closeManually: false,
      overlayOpacity: 0.1,
      // This widget doesn't have a center property
      marginRight: (MediaQuery.of(context).size.width / 2) - 33,
      elevation: 15.0,
      backgroundColor: SpecificColors(context).dropdownBackgroundColor,

      // Use SizedBox to define image size
      child: SizedBox(
          height: 38, child: Image.asset('assets/images/rocket_fab.png')),
      children: [
        // Solar system
        SpeedDialChild(
            // Disable background color and elevation to match UI style
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreHome(
                  title: 'Solar system',
                  headerText: 'Planets',
                  arrayCardText: PlanetsInfos().planetsName,
                  arrayCardSubtitleText: planetsSubtitle,
                  overviewDescription: 'Our solar system consists of our star, the Sun, and everything bound to it by gravity — the planets Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus and Neptune, dwarf planets such as Pluto, dozens of moons and millions of asteroids, comets and meteoroids. Beyond our own solar system, we have discovered thousands of planetary systems orbiting other stars in the Milky Way.',
                )));
            },
            backgroundColor: Colors.transparent,
            elevation: 0,
            // Set custom label widget (Default is a text with background color)
            labelWidget: Padding(
              // Set padding, otherwise it'll be too close to the fab
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Solar system',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            // Use FloatingActionButton to set image size (nope, SizedBox and Container doesn't works. This package is garbage, but the only one)
            child: FloatingActionButton(
              child: SizedBox(
                  height: 32,
                  child: Image.asset('assets/images/solar_system.png')),      
            ))
      ],
    );
  }
}
