import 'package:flutter/material.dart';
import 'package:travel_app/theme.dart';

class PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final VoidCallback onClick;

  const PropertyCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 230,
      // padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 300,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              // color: kWhiteColor,
            ),
            child: ClipRRect(
             borderRadius: BorderRadius.only(topLeft:Radius.circular(16),topRight: Radius.circular(16)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fitWidth,
                // height:150,
                // width:300,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:15,left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icon_location_orange.png",
                          width: 10,
                        ),
                        SizedBox(width: 5),
                        Text(
                          location,
                          style: greyTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: onClick,
                  child: Image.asset(
                    "assets/img_button_detail.png",
                    width: 70,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
