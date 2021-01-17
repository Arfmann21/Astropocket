import 'package:flutter/material.dart';

class SpecificColors {

  // Onboarding colors (only dark)
  Color exploreTextColor;
  Color startNowTextColor;

  Color dropdownBackgroundColor;
  Color dropdownIconColor;
  Color blackWhiteTextColor;

  Color shimmerColor;
  Color skeletonContainerColor;

  Color pulseColorBase;
  Color pulseColorHighlight;

  Color systemNavigationBarColor;
  Color statusBarColor;

  Color darkGreyLightGreyColor;
  Color lightGreyDarkGreyColor;

  Color exploreCardColor;
  Color cardColor;

  SpecificColors(BuildContext context) {
        final ThemeData currentTheme = Theme.of(context);

        // Onboarding colors
        exploreTextColor = Color(0xFFE6E6E6);
        startNowTextColor = Color(0xFFE6E6E6);

        dropdownBackgroundColor = currentTheme.brightness == Brightness.light ? Color(0xFFFFFFFF) : Color(0xFF04294F);
        dropdownIconColor = currentTheme.brightness == Brightness.light ? Color(0xFFFFFFF) : Color(0xFF346F94);
        blackWhiteTextColor = currentTheme.brightness == Brightness.light ? Color(0xFF212121) : Color(0xFFE6E6E6);

        darkGreyLightGreyColor = currentTheme.brightness == Brightness.light ? Color(0xFF333333) : Color(0xFFcccccc);
        lightGreyDarkGreyColor = currentTheme.brightness == Brightness.light ? Color(0xFF404040) : Color(0xFFBFBFBF);

        pulseColorBase = currentTheme.brightness == Brightness.light ? Color(0xFFD9D9D9) : Color(0xFF0c3046);

        shimmerColor = Color(0xFFE6E6E6);

        systemNavigationBarColor = currentTheme.brightness == Brightness.light ? Color(0xFFf2f2f2) : Color(0xFF042649);

        exploreCardColor = currentTheme.brightness == Brightness.light ? Color(0xFF404040) : Color(0xFF052748);
  }
}