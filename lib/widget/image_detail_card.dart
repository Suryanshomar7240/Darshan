import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/theme.dart';

class ImageDetailCard extends StatelessWidget {
  final String destination;
  final GeoPoint location;
  final String imageUrl;

  const ImageDetailCard({
    Key? key,
    required this.destination,
    required this.location,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: 410,
        height: 410,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageUrl),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: 410,
        height: 410,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.80),
              ]),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(top: 330, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              destination,
              style: whiteTextStyle.copyWith(fontSize: 24, fontWeight: medium),
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icon_location.png",
                        width: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '(${location.latitude}, ${location.longitude})',
                        style: greyTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 130),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icon_share.png",
                        width: 25,
                      ),
                      SizedBox(width: 30),
                      Image.asset(
                        "assets/icon_love.png",
                        width: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Stack(
      children: [
        backgroundImage(),
        customShadow(),
        content(),
      ],
    );
  }
}
