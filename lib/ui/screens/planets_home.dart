import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/ui/widgets/planets/planets_horizontal_list.dart';
import 'package:astropocket/ui/widgets/planets/planets_overview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../backend/planets_infos.dart';

class PlanetsHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Solar System',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 22.0),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: getHeight(context) / 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: getWidth(context) / 20),
                    child: Text(
                      'Planets',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 23.0),
                    ),
                  ),
                  Container(
                    height: getWidth(context) / 1.5,
                    width: getWidth(context),
                    margin: EdgeInsets.only(top: getHeight(context) / 80.0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: getWidth(context) / 15,
                        );
                      },
                      padding: EdgeInsets.only(
                          left: getWidth(context) / 36.0,
                          right: getWidth(context) / 36.0),
                      scrollDirection: Axis.horizontal,
                      itemCount: PlanetsInfos().planetsName.length,
                      itemBuilder: (context, index) {
                        return PlanetsHorizontalList(
                          index: index,
                        );
                      },
                    ),
                  ),
                  PlanetsOverview()
                ],
              ),
            ),
          )),
    );
  }
}
