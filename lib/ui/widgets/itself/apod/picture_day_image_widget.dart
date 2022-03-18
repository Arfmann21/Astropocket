import 'package:astropocket/backend/global_variables.dart';
import 'package:astropocket/style/specific_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';

class PictureDayImageWidget extends StatefulWidget {
  @override
  _PictureDayImageWidgetState createState() => _PictureDayImageWidgetState();
}

class _PictureDayImageWidgetState extends State<PictureDayImageWidget> {
  var isExpanded = false;
  int _downloadProgress = 0;

  @override
  void initState() {
    super.initState();

    ImageDownloader.callback(onProgressUpdate: (String imageId, int progress) {
      setState(() {
        _downloadProgress = progress;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        return true;
      },
      child: Column(
        children: [
          // Pciture container
          Container(
            //Use Card for the elevation
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(getWidth(context) / 36)),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Hero(
                    tag: "apodHero",
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(getWidth(context) / 36.0),
                      child: CachedNetworkImage(
                        imageUrl: apodObject.hdurl,
                        placeholder: (context, url) {
                          return Container();
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () async {
                            if (await Permission.storage.request().isGranted) {
                              _downloadImage(apodObject.hdurl);

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      duration: Duration(seconds: 2),
                                      backgroundColor: SpecificColors(context)
                                          .snackbarBackgroundColor,
                                      content: Text(
                                        'Download started',
                                        style: GoogleFonts.poppins(
                                            color: SpecificColors(context)
                                                .timerTextColor),
                                      )));
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: getWidth(context) / 36.0,
                                right: getWidth(context) / 36.0),
                            height: getWidth(context) / 7.0,
                            width: getWidth(context) / 7.0,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(33, 33, 33, 80),
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    width: getWidth(context) / 5,
                                    height: getWidth(context) / 5,
                                    child: CircularProgressIndicator(
                                      value: _downloadProgress.toDouble(),
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          SpecificColors(context)
                                              .snackbarBackgroundColor),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Icon(
                                    Icons.download_outlined,
                                    size: 36,
                                    color: SpecificColors(context).shimmerColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _downloadImage(String url,
      {AndroidDestinationType destination,
      bool whenError = false,
      String outputMimeType}) async {
    try {
      String imageId;

      if (whenError) {
        imageId = await ImageDownloader.downloadImage(url,
                outputMimeType: outputMimeType)
            .catchError((error) {
          if (error is PlatformException) {
            if (error.code == "404") {
              print("Not Found Error.");
            } else if (error.code == "unsupported_file") {
              print("UnSupported FIle Error.");
            }
          }

          print(error);
        }).timeout(Duration(seconds: 10), onTimeout: () {
          print("timeout");
          return;
        });
      } else {
        if (destination == null) {
          imageId = await ImageDownloader.downloadImage(
            url,
             
          );
        } else {
          imageId = await ImageDownloader.downloadImage(
            url,
          );
        }
      }

      if (imageId == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: SpecificColors(context).snackbarBackgroundColor,
            content: Text(
              'In order to download the picture, please grant access to internal storage',
              style: GoogleFonts.poppins(
                  color: SpecificColors(context).timerTextColor),
            )));
        return;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: SpecificColors(context).snackbarBackgroundColor,
            content: Text(
              'Download completed',
              style: GoogleFonts.poppins(
                  color: SpecificColors(context).timerTextColor),
            )));
      }
    } on PlatformException catch (error) {
      print(error.toString());
      return;
    }

    if (!mounted) return;
  }
}
