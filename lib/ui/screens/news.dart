import 'dart:async';

import 'package:astropocket/backend/global_variables.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  int _index = 0;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        Navigator.pop(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.article_outlined), label: 'Articles'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.web_outlined), label: 'Blogs')
            ],
          ),
          appBar: AppBar(
            title: Hero(
              tag: 'newsHero',
              child: Material(
                color: Colors.transparent,
                child: Text(
                  'News',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600, fontSize: 22.0),
                ),
              ),
            ),
          ),
          body: newsPages[_index]),
    );
  }
}
