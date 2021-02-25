import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/themes.dart';
import 'package:astropocket/ui/screens/changelog.dart';
import 'package:astropocket/ui/screens/home.dart';
import 'package:astropocket/ui/screens/onboarding/onboarding_home.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  themeChanger.currentTheme();
  timeDilation = 1.3;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFirstAccess = false;
  bool isThereAChangelog = false;
  String savedVersion;
  ThemeMode themeMode = ThemeMode.dark;

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();

    _initPackageInfo();
    themeChanger.addListener(() {
      setState(() {});
    });
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });

    checkFirstAccessAndSettings();
  }

  Future<void> checkFirstAccessAndSettings() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var isFirstAccessPref = pref.getBool('isFirstAccess') ?? true;
    isCelsius = pref.getBool('isCelsius') ?? false;
    dateFormat = pref.getString('dateFormat') ?? "mdy";

    setState(() {
      savedVersion = pref.getString('savedVersion') ?? '0';
    });

    if (isFirstAccessPref) {
      setState(() {
        isFirstAccess = true;
      });

      pref.setBool('isFirstAccess', false);
    } else {
      setState(() {
        isFirstAccess = false;
      });
    }

    if (savedVersion != _packageInfo.version && !isFirstAccess) {
      setState(() {
        isThereAChangelog = true;
      });
    }

    pref.setString('savedVersion', _packageInfo.version);
    appVersion = _packageInfo.version;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AstroPocket',
      themeMode: themeChanger.currentTheme(),
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: isFirstAccess
          ? OnBoardingHome()
          : isThereAChangelog
              ? Changelog(
                  versionNumber: _packageInfo.version,
                )
              : HomeDrawerBuilder(),
    );
  }
}
