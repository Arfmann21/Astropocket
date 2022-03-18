import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/issdateparse.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/screens/iss/issnextpassedetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IssPassesOverviewList extends StatelessWidget {
  final AsyncSnapshot snapshot;

  IssPassesOverviewList({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getWidth(context) / 30.0),
      child: ListView.builder(
        itemCount: snapshot.data.passesCount,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IssNextPasseDetails(
                            snapshot: snapshot.data.general['passes'][index],
                          )));
            },
            child: Container(
              width: getWidth(context),
              height: getWidth(context) / 3.1,
              margin: EdgeInsets.only(
                  left: getWidth(context) / 36.0,
                  right: getWidth(context) / 36.0,
                  top: getWidth(context) / 20.0),
              decoration: BoxDecoration(
                  color: SpecificColors(context)
                      .issNextPassesOverviewBackgroundColor,
                  borderRadius:
                      BorderRadius.circular(getWidth(context) / 70.0)),
              child: Container(
                margin: EdgeInsets.only(
                    left: getWidth(context) / 30.0,
                    right: getWidth(context) / 30.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: getWidth(context) / 30.0),
                      child: Text(
                        IssDateParse().parse(
                            DateTime.fromMillisecondsSinceEpoch(snapshot
                                    .data.general['passes'][index]['startUTC'] *
                                1000)),
                        style: GoogleFonts.poppins(
                            fontSize: 17.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: getWidth(context) / 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Start: ' +
                                DateTime.fromMillisecondsSinceEpoch(
                                        snapshot.data.general['passes'][index]
                                                ['startUTC'] *
                                            1000)
                                    .toString()
                                    .substring(11, 19),
                            style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                color:
                                    SpecificColors(context).secondaryTextColor),
                          ),
                          Text(
                            snapshot.data.general['passes'][index]
                                    ['startAzCompass'] +
                                '  ' +
                                snapshot
                                    .data.general['passes'][index]['startAz']
                                    .toString() +
                                '°',
                            style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                color:
                                    SpecificColors(context).secondaryTextColor),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: getWidth(context) / 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'End: ' +
                                DateTime.fromMillisecondsSinceEpoch(
                                        snapshot.data.general['passes'][index]
                                                ['endUTC'] *
                                            1000)
                                    .toString()
                                    .substring(11, 19),
                            style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                color:
                                    SpecificColors(context).secondaryTextColor),
                          ),
                          Text(
                            'Mag ' +
                                snapshot.data.general['passes'][index]['mag']
                                    .toString(),
                            style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                                color:
                                    SpecificColors(context).secondaryTextColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
