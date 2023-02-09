import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/theme.dart';
import 'package:travel_app/widget/button.dart';
import 'package:travel_app/widget/image_detail_card.dart';
import 'package:travel_app/widget/youtube_embed.dart';

class DetailPage extends StatelessWidget {
  get kBackgroundColor => null;
  final String imageUrl;
  final String about;
  final String destination;
  final String videoID;
  final Map<dynamic, dynamic> location;

  DetailPage(this.imageUrl, this.about, this.destination, this.location, this.videoID,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/home");
            },
            child: Image.asset(
              'assets/icon_back.png',
              width: 60,
              height: 60,
            ),
          ),
          Text(
            "Details",
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          Image.asset(
            "assets/icon_three_dots.png",
            width: 60,
            height: 60,
          ),
        ],
      );
    }

    Widget detailContent() {
      return Container(
        child: Column(
          children: [
            ImageDetailCard(
              destination: destination,
              location: location['coordinates'],
              imageUrl: imageUrl,
            ),
            SizedBox(height: 16.5),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/image_detail1.png",
                    width: 71,
                  ),
                  Image.asset(
                    "assets/image_detail2.png",
                    width: 71,
                  ),
                  Image.asset(
                    "assets/image_detail3.png",
                    width: 71,
                  ),
                  Image.asset(
                    "assets/image_detail4.png",
                    width: 71,
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Button(
                    width: 80,
                    height: 32,
                    fontSize: 14,
                    marginLeft: 0,
                    marginRight: 0,
                    borderRadius: 7,
                    content: "Details",
                    onClick: () {},
                    isThereIcon: false,
                    isUsingShadow: false,
                  ),
                  SizedBox(width: 15),
                  Button(
                    width: 80,
                    height: 32,
                    fontSize: 14,
                    marginLeft: 0,
                    marginRight: 0,
                    borderRadius: 7,
                    content: "Review",
                    onClick: () {},
                    isThereIcon: false,
                    isUsingShadow: false,
                    color: kWhiteColor,
                    textStyle: blackTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(height: 23),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    about,
                    style: GoogleFonts.roboto().copyWith(
                      color: kGreyColor,
                      height: 2,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Read more...",
                    style: GoogleFonts.roboto().copyWith(
                      color: kOrangeColor,
                      height: 2,
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 28),
          ],
        ),
      );
    }

    Widget pano() {
      return Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Button(
            isUsingShadow: false,
            width: 203,
            height: 54,
            fontSize: 22,
            content: 'Visit 360',
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                      builder: (context) => YoutubeEmbed(
                            videoID: videoID,
                          )
                  )
              );
            },
          ));
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: 23,
              right: 23,
              top: 27,
              bottom: 100,
            ),
            child: Column(
              children: [
                header(),
                SizedBox(height: 35),
                detailContent(),
                pano(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
