import 'dart:async';

import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:astropocket/ui/widgets/home/home_appbar.dart';
import 'package:astropocket/ui/widgets/home/news/news_home.dart';
import 'package:astropocket/ui/widgets/home/picture_day/picture_day_home_widget.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _connectionStatus = 'Unknown';

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return updateConnectionStatus(result);
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionNotifier.setAvailability(isAvaible: true);
        setState(() {
          _connectionStatus = result.toString();
        });
        break;
      case ConnectivityResult.mobile:
        connectionNotifier.setAvailability(isAvaible: true);
        setState(() {
          _connectionStatus = result.toString();
        });
        break;
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());
        connectionNotifier.setAvailability();
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _connectionStatus == 'ConnectivityResult.none'
            ? Column(
                children: [
                  HomeAppbar(),
                  Container(
                      height: getHeight(context) / 6.22,
                      margin: EdgeInsets.only(top: getHeight(context) / 1.5),
                      child: Image.asset('assets/images/no_connection.png')),
                  Padding(
                    padding: EdgeInsets.only(
                        top: getHeight(context) / 31.1,
                        left: getWidth(context) / 18.0,
                        right: getWidth(context) / 18.0),
                    child: Text(
                      'No internet connection',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Text(
                      'Check your connection and try again',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: SpecificColors(context).blueGreenColor),
                    ),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    HomeAppbar(),
                    Padding(
                      padding: EdgeInsets.only(
                          top: getHeight(context) / 50,
                          left: getWidth(context) / 18.0,
                          right: getWidth(context) / 18.0),
                      child: PictureDayHomeWidget(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: getHeight(context) / 62.2,
                          left: getWidth(context) / 18.0,
                          right: getWidth(context) / 18.0,
                          bottom: getWidth(context) / 20.0),
                      child: NewsHome(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
