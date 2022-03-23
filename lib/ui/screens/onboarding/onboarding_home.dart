import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding:
                    EdgeInsetsDirectional.only(top: getWidth(context) / 8.0),
                child: Image.asset(
                  'assets/images/onboarding_image.png',
                  height: getHeight(context) / 3,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Explore',
                      style: GoogleFonts.poppins(
                        fontSize: 33.0,
                        fontWeight: FontWeight.w600,
                        color: SpecificColors(context).primaryTextColor,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: getHeight(context) / 30,
                        left: getWidth(context) / 18.0,
                        right: getWidth(context) / 18.0),
                    child: Text(
                      'Start your journey across the universe with tons of services, including Mars weather, Moon phases, NASA reports and much more.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(217, 217, 217, 50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: getWidth(context),
                height: getHeight(context) / 12,
                margin: EdgeInsets.only(
                    left: getWidth(context) / 14.4,
                    right: getWidth(context) / 14.4),
                 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(getWidth(context) / 36.0)),
                    primary: Color(0xFF082C50),
                  ),
                  child: Text(
                    'LIFTOFF',
                    style: GoogleFonts.poppins(
                      fontSize: 20.0, 
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFff944d)
                      ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeDrawerBuilder()));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
