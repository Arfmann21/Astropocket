import 'package:flutter/material.dart';

class SpecificColors {
  // Onboarding colors (only dark)
  Color exploreTextColor;
  Color startNowTextColor;

  Color backgroundColorAsScaffold;
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
  Color backgroundAsCardColor;

  Color timerBackgroundColor;
  Color timerTextColor;

  Color unselectedLabelColor;
  Color selectedLabelColor;
  Color indicatorColor;

  Color stateColor;
  Color unavaibleLaunchVideoColor;

  Color launchFailedColor;

  Color secondaryTextColor;
  Color primaryTextColor;

  Color marsHighColor;
  Color marsLowColor;

  Color checkboxcCheckedColor;
  Color checkboxActiveBoxColor;

  SpecificColors(BuildContext context) {
    final ThemeData currentTheme = Theme.of(context);

    // Onboarding colors
    exploreTextColor = Color(0xFFE6E6E6);
    startNowTextColor = Color(0xFFE6E6E6);

    backgroundColorAsScaffold = currentTheme.brightness == Brightness.light
        ? Color(0xFFFAFAFA)
        : Color(0xF031a30);
    dropdownIconColor = currentTheme.brightness == Brightness.light
        ? Color(0xFFFFFFF)
        : Color(0xFF346F94);
    blackWhiteTextColor = currentTheme.brightness == Brightness.light
        ? Color(0xFF212121)
        : Color(0xFFE6E6E6);

    darkGreyLightGreyColor = currentTheme.brightness == Brightness.light
        ? Color(0xFF0066cc)
        : Color(0xFF00b389);
    lightGreyDarkGreyColor = currentTheme.brightness == Brightness.light
        ? Color(0xFF404040)
        : Color(0xFFBFBFBF);

    pulseColorBase = currentTheme.brightness == Brightness.light
        ? Color(0xFFD9D9D9)
        : Color(0xFF0c3046);

    shimmerColor = Color(0xFFE6E6E6);

    systemNavigationBarColor = currentTheme.brightness == Brightness.light
        ? Color(0xFFf2f2f2)
        : Color(0xFF042649);

    exploreCardColor = currentTheme.brightness == Brightness.light
        ? Color(0xFF404040)
        : Color(0xFF052748);

    backgroundAsCardColor = currentTheme.brightness == Brightness.light
        ? Color(0xFFFFFFFF)
        : Color(0xFF1c3046);

    timerBackgroundColor = currentTheme.brightness == Brightness.light
        ? Color.fromRGBO(33, 33, 33, 80)
        : Color.fromRGBO(28, 48, 70, 50);
    timerTextColor = currentTheme.brightness == Brightness.light
        ? Color(0xFFE6E6E6)
        : Color(0xFFD9D9D9);

    selectedLabelColor = currentTheme.brightness == Brightness.light
        ? Color(0xFF0066cc)
        : Color(0xFF00b389);
    unselectedLabelColor = currentTheme.brightness == Brightness.light
        ? Color(0xFF757575)
        : Color(0xFFa6a6a6);
    indicatorColor = currentTheme.brightness == Brightness.light
        ? Color(0xFF0066cc)
        : Color(0xFF00b389);

    // State color is also used for Success and Ready to launch
    stateColor = currentTheme.brightness == Brightness.light
        ? Color(0xFF158936)
        : Color(0xFF00b389);
    unavaibleLaunchVideoColor = currentTheme.brightness == Brightness.light
        ? Color(0xFF212121)
        : Color(0xFF1c3046);

    launchFailedColor = currentTheme.brightness == Brightness.light
        ? Color(0xFFcc0000)
        : Color(0xFFff4d4d);

    secondaryTextColor = currentTheme.brightness == Brightness.light
        ? Color(0xFF757575)
        : Color(0xFFb3b3b3);
    primaryTextColor = currentTheme.brightness == Brightness.light
        ? Color(0xFF2414C6B)
        : Color(0xFFbfbfbf);

    marsHighColor = currentTheme.brightness == Brightness.light
        ? Color(0xFFD58235)
        : Color(0xFFD58235);
    marsLowColor = Color(0xFF247FDB);

    checkboxcCheckedColor = currentTheme.brightness == Brightness.light
        ? Color(0xFFE6E6E6)
        : Color(0xFF404040);

    checkboxActiveBoxColor = currentTheme.brightness == Brightness.light
        ? Color(0xFF158936)
        : Color(0xFF00b389);
  }
}
