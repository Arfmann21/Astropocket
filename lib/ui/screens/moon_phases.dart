import 'package:astropocket/backend/date_parse.dart';
import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/backend/moon_phases_returner.dart';
import 'package:astropocket/style/custom_icons/calendar_icon_icons.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class MoonPhases extends StatefulWidget {
  @override
  _MoonPhasesState createState() => _MoonPhasesState();
}

class _MoonPhasesState extends State<MoonPhases> {
  var dateTime;

  @override
  void initState() {
    dateTime = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Material(
            color: Colors.transparent,
            child: Text(
              'Moon phases',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 21.5),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(CalendarIcon.calendar_month_outline),
              onPressed: () async {
                DateTime selectedDateTime = await showRoundedDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                  height: getHeight(context) / 2.3,
                  styleDatePicker: MaterialRoundedDatePickerStyle(
                    textStyleButtonNegative: GoogleFonts.poppins(
                        color: SpecificColors(context).secondaryTextColor,
                        fontWeight: FontWeight.w400),
                    textStyleButtonPositive: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                    ),
                    textStyleMonthYearHeader:
                        TextStyle(color: SpecificColors(context).secondaryTextColor),
                    colorArrowNext:  SpecificColors(context).secondaryTextColor,
                    colorArrowPrevious:  SpecificColors(context).secondaryTextColor,
                    paddingDateYearHeader: EdgeInsets.only(
                        top: getWidth(context) / 15.0,
                        bottom: getWidth(context) / 20.0,
                        left: getWidth(context) / 36.0),
                    paddingMonthHeader: EdgeInsets.only(
                        top: getWidth(context) / 25.0,
                        bottom: getWidth(context) / 15.0),
                  ),
                  theme: themeChanger.currentTheme() == ThemeMode.dark
                      ? ThemeData(
                          primaryColor: Color(0xFF082C50),
                          dialogBackgroundColor: Color(0xFF031a30),
                          textTheme: TextTheme(
                            caption: TextStyle(
                              color: Color(0xFFD9D9D9),
                            ),
                            bodyText2: TextStyle(color: Color(0xFFF1F1F1)),
                          ),
                        )
                      : ThemeData.light(),
                  textPositiveButton: 'Select',
                  textNegativeButton: 'Cancel',
                );

                if (selectedDateTime != null) {
                  setState(() {
                    dateTime = DateTime(
                        selectedDateTime.year,
                        selectedDateTime.month,
                        selectedDateTime.day,
                        dateTime.hour,
                        dateTime.minute);
                  });
                }
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: getWidth(context) / 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_outlined),
                      onPressed: () {
                        setState(() {
                          dateTime = DateTime(dateTime.year, dateTime.month,
                              (dateTime.day - 1), dateTime.hour, dateTime.minute);
                        });
                      },
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: DateParse(dateTime).getParse(),
                            style: GoogleFonts.poppins(
                                fontSize: 19.0,
                                fontWeight: FontWeight.w500,
                                color: SpecificColors(context).primaryTextColor)),
                        TextSpan(
                            text: '\n${DateParse(dateTime).getWeekDay()}',
                            style: GoogleFonts.poppins(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: SpecificColors(context).secondaryTextColor,
                            ))
                      ]),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios_outlined),
                      onPressed: () {
                        setState(() {
                          dateTime = DateTime(dateTime.year, dateTime.month,
                              dateTime.day + 1, dateTime.hour, dateTime.minute);
                        });
                      },
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: getWidth(context) / 15.0,
                      left: getWidth(context) / 20.0,
                      right: getWidth(context) / 20.0),
                  height: getHeight(context) / 3.0,
                  width: getWidth(context),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(getWidth(context) / 36.0)),
                    color: Colors.black,
                    child: Stack(
                      children: [
                        Container(
                            height: getHeight(context),
                            width: getWidth(context),
                            child: Image.asset(
                              'assets/images/stars.jpg',
                              fit: BoxFit.cover,
                            )),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: getHeight(context) / 5.0,
                              child: Image.asset(
                                  'assets/images/moon/${Moon.phase(dateTime).toLowerCase().replaceAll(" ", "") + '.png'}')),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: getWidth(context) / 15.0,
                      top: getWidth(context) / 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Moon.phase(dateTime),
                        style: GoogleFonts.poppins(
                            fontSize: 27.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Phase',
                        style: GoogleFonts.poppins(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: SpecificColors(context).secondaryTextColor),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getWidth(context) / 20.0),
                        child: Text(
                          Moon.getIlluminationPercentage(Moon.phase(dateTime)),
                          style: GoogleFonts.poppins(
                              fontSize: 27.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        'Illumination',
                        style: GoogleFonts.poppins(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: SpecificColors(context).secondaryTextColor),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getWidth(context) / 20.0),
                        child: Text(
                          (Moon.ageOfMoon(dateTime)).toStringAsFixed(2) + ' days',
                          style: GoogleFonts.poppins(
                              fontSize: 27.0, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        'Moon Age',
                        style: GoogleFonts.poppins(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: SpecificColors(context).secondaryTextColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
