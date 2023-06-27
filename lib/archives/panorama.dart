import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';

class PanoramaShow extends StatelessWidget {
  final String videoUrl;
  PanoramaShow(this.videoUrl);

  get kBackgroundColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Panorama(
        child: Image.asset(videoUrl),
      ),
      InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/detail-page");
          },
          child: Padding(
            padding: EdgeInsets.only(top: 30.0, left: 6.0),
            child: Image.asset(
              'assets/icon_back.png',
              width: 60,
              height: 60,
            ),
          )),
    ]));
  }
}
