
import 'package:flutter_web_browser/flutter_web_browser.dart';

void launchURL(url) async {
    try {
      FlutterWebBrowser.openWebPage(url: url);
    } catch(e) {
      
    }
   
  }