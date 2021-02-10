import 'package:astropocket/backend/global_variables.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PictureDayItselfWidget extends StatefulWidget {
  @override
  _PictureDayItselfWidgetState createState() => _PictureDayItselfWidgetState();
}

class _PictureDayItselfWidgetState extends State<PictureDayItselfWidget> {
  var isExpanded = false;

  @override
  void initState() {
    apodScrolling.addListener(() {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Pciture container
        Container(
          // Use Card for the elevation
          child: Card(
              color: Colors.transparent,
              elevation: 10,
              child: Hero(
                tag: 'apodHero',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(getWidth(context) / 36),
                  child: InteractiveViewer(
                    onInteractionUpdate: (scaleDetails) {
                   //   print(scaleDetails);
                      if (scaleDetails.focalPoint.distance < 1.0)
                        apodScrolling.setScrollTrue();
                      else
                        apodScrolling.setScrollFalse();
                    },
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: apodObject.hdurl,
                      placeholder: (context, url) {
                        return Container();
                      },
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
