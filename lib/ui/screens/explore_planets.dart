import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/widgets/planets/specific/major_moons_list.dart';
import 'package:astropocket/ui/widgets/planets/specific/planet_facts.dart';
import 'package:astropocket/ui/widgets/planets/specific/planet_top_section.dart';
import 'package:astropocket/ui/widgets/planets/specific/planet_overview.dart';
import 'package:flutter/material.dart';

class ExplorePlanets extends StatelessWidget {
  final planetName;
  final planetSubtitle;
  final heroTag;

  final List<String> majorMoons;
  final List<String> facts;
  final List<String> factsTitle;

  ExplorePlanets(
      {this.planetName, this.planetSubtitle, this.heroTag, this.majorMoons, this.facts, this.factsTitle});


  /*final List<Icon> iconList = [
    Icon(Icons.description_outlined),
    Icon(Icons.explore_outlined),
    Icon(Icons.aspect_ratio),
    Icon(OrbitIcon.orbit),
    Icon(Icons.view_module_outlined),
    Icon(CreationIcon.creation),
    Icon(Icons.texture_outlined),
    Icon(AtmosphereIcon.airballoon_outline),
    Icon(MagnetosphereIcon.magnet),
    Icon(RingIcon.ring),
    Icon(Icons.nights_stay),
    Icon(Icons.emoji_nature)
  ];

  final PlanetsInfos planetsInfos = new PlanetsInfos();

  final Icon selectedIcon = Icon(Icons.description_outlined);

  final String selectedItem = 'Description';*/

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: getHeight(context) / 30),
          child: Column(
            children: [

              // Planet image, title and subtitle
              PlanetTopSection(
                heroTag: heroTag,
                planetName: planetName,
                planetSubtitle: planetSubtitle,
              ),

              // Planet type, year lenght, distance from Sun and day lenght
              PlanetOverview(planetName: planetName,),

              // Separator
              Padding(
                padding: EdgeInsets.only(
                    top: getHeight(context) / 20.0,
                    bottom: getHeight(context) / 20.0,
                    left: getWidth(context) / 36.0,
                    right: getWidth(context) / 36.0),
                child: Container(
                  width: double.infinity,
                  height: 2,
                  color: SpecificColors(context).blueGreenColor,
                ),
              ),

              MajorMoonsList(majorMoons: majorMoons, planetName: planetName,),

               // Separator
              Padding(
                padding: EdgeInsets.only(
                    top: getHeight(context) / 20.0,
                    bottom: getHeight(context) / 20.0,
                    left: getWidth(context) / 36.0,
                    right: getWidth(context) / 36.0),
                child: Container(
                  width: double.infinity,
                  height: 2,
                  color: SpecificColors(context).blueGreenColor,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: getHeight(context) / 20.0),
                child: PlanetFacts(facts: facts, factsTitle: factsTitle,),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
