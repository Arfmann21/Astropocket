import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/themes.dart';
import 'package:astropocket/ui/screens/home.dart';
import 'package:astropocket/ui/screens/onboarding/onboarding_home.dart';
import 'package:flutter/material.dart';
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
  ThemeMode themeMode = ThemeMode.dark;

  @override
  void initState() {
    checkFirstAccess();
    themeChanger.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  Future<void> checkFirstAccess() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var isFirstAccessPref = pref.getBool('isFirstAccess') ?? true;

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
          : HomeDrawerBuilder(),
    );
  }
}
