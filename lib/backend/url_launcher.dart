import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

void launchURL(url) async {
    /*if (await canLaunch(url)) {
      await launch(url, enableDomStorage: true, enableJavaScript: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }*/

    try {
      await launch(
        url,
          option: new CustomTabsOption(
            enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          extraCustomTabs: <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],        
          ),    
          
      );
    } catch (e) {
      throw 'Could not launch $url';
    }
  }