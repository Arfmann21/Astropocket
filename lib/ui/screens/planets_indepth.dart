import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/planets_infos.dart';
import 'package:astropocket/style/custom_icons/atmosphere_icon_icons.dart';
import 'package:astropocket/style/custom_icons/orbit_icon_icons.dart';
import 'package:astropocket/style/custom_icons/creation_icon_icons.dart';
import 'package:flutter/material.dart';

class ExplorePlanetsInDepth extends StatefulWidget {
  final planetName;

  ExplorePlanetsInDepth({this.planetName});

  @override
  _ExplorePlanetsInDepthState createState() => _ExplorePlanetsInDepthState();
}

class _ExplorePlanetsInDepthState extends State<ExplorePlanetsInDepth> {
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

  Icon selectedIcon = Icon(
    Icons.description_outlined,
    color: Color(0xFFD58235),
  );
  String selectedItem = 'Description';

  bool isExpanded = false;

  PlanetsInfos planetsInfos = new PlanetsInfos();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.only(
                top: getHeight(context) / 100.0,
                right: getWidth(context) / 30.0,
                left: getWidth(context) / 30.0,
                bottom: getWidth(context) / 20.0),
            child:Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    selectedIcon,
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: getWidth(
                                                                  context) /
                                                              36.0),
                                                      child: Text(
                                                        selectedItem,
                                                        style: TextStyle(
                                                            fontSize: 19.0,
                                                            color: Color(
                                                                0xFFD58235),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Transform.rotate(
                                                  alignment: Alignment.center,
                                                  angle: isExpanded
                                                      ? 180 * 3.14 / 180
                                                      : 0,
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Color(0xFFD58235),
                                                    ),
                                                    iconSize: 32.0,
                                                    onPressed: () {
                                                      setState(() {
                                                        isExpanded =
                                                            !isExpanded;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                      height:
                                                          getHeight(context),
                                                      width: getWidth(context),
                                                      child: ListView.builder(
                                                          itemCount:
                                                              inDepthItemsList
                                                                  .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                setState(() {
                                                                  isExpanded =
                                                                      !isExpanded;
                                                                  selectedItem =
                                                                      inDepthItemsList[
                                                                          index];
                                                                });
                                                              },
                                                              child: Text(
                                                                  inDepthItemsList[
                                                                      index]),
                                                            );
                                                          })),
                                                  AnimatedPositioned(
                                                    duration: Duration(
                                                        milliseconds: 1000),
                                                    top: isExpanded
                                                        ? 0.2 *
                                                            getHeight(context)
                                                        : 0.0,
                                                    child: Container(
                                                        height:
                                                            getHeight(context),
                                                        width:
                                                            getWidth(context),
                                                        color: Colors.white,
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Text(planetsInfos
                                                              .getInfos(widget
                                                                  .planetName)[4]),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
      ),
    );
  }
}
