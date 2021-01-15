import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/planets_infos.dart';
import 'package:astropocket/style/custom_icons/atmosphere_icon_icons.dart';
import 'package:astropocket/style/custom_icons/creation_icon_icons.dart';
import 'package:astropocket/style/custom_icons/expand_icon_icons.dart';
import 'package:astropocket/style/custom_icons/orbit_icon_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePlanets extends StatefulWidget {
  final planetName;
  final planetSubtitle;
  final heroTag;

  ExplorePlanets({this.planetName, this.planetSubtitle, this.heroTag});

  @override
  _ExplorePlanetsState createState() => _ExplorePlanetsState();
}

class _ExplorePlanetsState extends State<ExplorePlanets> {
  bool isExpanded = false;

  List<Icon> iconList = [
    Icon(Icons.description_outlined),
    Icon(Icons.explore_outlined),
    Icon(OrbitIcon.orbit),
    Icon(Icons.view_module_outlined),
    Icon(CreationIcon.creation),
    Icon(Icons.texture_outlined),
    Icon(AtmosphereIcon.airballoon_outline)
  ];

  List<String> inDepthItemsList = [
    'Description',
    'Exploration',
    'Orbit and Rotation',
    'Structure',
    'Formation',
    'Surface',
    'Atmosphere',
    'Magnetosphere',
    'Moons',
    'Potential for Life'
  ];

  PlanetsInfos planetsInfos = new PlanetsInfos();

  Icon selectedIcon = Icon(Icons.description_outlined);

  String selectedItem = 'Description';

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
              Stack(
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
                            tag: widget.heroTag + 'Hero',
                            child: Image.asset(
                              'assets/images/planets/${widget.planetName.toLowerCase()}.png',
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
                          widget.planetName.toUpperCase(),
                          style: GoogleFonts.poppins(
                              fontSize: 35, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          widget.planetSubtitle,
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Color(0xFFD58235),
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  )
                ],
              ),
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
                      IconButton(
                        icon: Icon(ExpandCustomIcon.arrow_expand),
                        onPressed: () {
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ExplorePlanetsInDepth(
                                        planetName: widget.planetName,
                                      )));*/
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      getWidth(context) / 36.0)),
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, StateSetter setState) {
                                  return Container(
                                    height: getHeight(context) / 1.2,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: getHeight(context) / 40.0,
                                          right: getWidth(context) / 30.0,
                                          left: getWidth(context) / 30.0,
                                          bottom: getWidth(context) / 20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'In-depth',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    color: Color(0xFFD58235),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: 7,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: EdgeInsets.only(
                                                    top: (index + 4) % 2 == 0 ? (index != 4 ? getHeight(context) / 40.0 : getHeight(context) / 50.0) : getHeight(context) / 70.0
                                                  ),
                                                  child: Text(
                                                    planetsInfos.getInfos(widget.planetName)[index + 4],
                                                    style: GoogleFonts.poppins(
                                                      fontSize: (index + 4) % 2 == 0 ? 17.0 : 15.0,
                                                      fontWeight: (index + 4) % 2 == 0 ? FontWeight.w600 : FontWeight.w500
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              }).whenComplete(() {
                            setState(() {
                              isExpanded = false;
                            });
                          });
                        },
                      )
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
                              PlanetsInfos().getInfos(widget.planetName)[0],
                              style: TextStyle(
                                  fontSize: 15.5, fontWeight: FontWeight.w700),
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
                              PlanetsInfos().getInfos(widget.planetName)[1],
                              style: TextStyle(
                                  fontSize: 15.5, fontWeight: FontWeight.w700),
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
                              PlanetsInfos().getInfos(widget.planetName)[2],
                              style: TextStyle(
                                  fontSize: 15.5, fontWeight: FontWeight.w700),
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
                              PlanetsInfos().getInfos(widget.planetName)[3],
                              style: TextStyle(
                                  fontSize: 15.5, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getHeight(context) / 20.0,
                    left: getWidth(context) / 36.0,
                    right: getWidth(context) / 36.0),
                child: Container(
                  width: double.infinity,
                  height: 2,
                  color: SpecificColors(context).darkGreyLightGreyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
