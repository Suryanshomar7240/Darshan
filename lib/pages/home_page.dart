// ignore_for_file: must_be_immutable

import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/services/auth.dart';
import 'package:travel_app/theme.dart';
import 'package:travel_app/widget/popular_card.dart';
import 'package:travel_app/widget/property_card.dart';
import 'package:travel_app/widget/tab_destination.dart';
import 'package:travel_app/widget/navigation.dart';

class HomePage extends StatelessWidget {
  List locationList = [];
  List<Widget> list = [];
  late String user;

  HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content() {
      Widget header() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 28),
              child: Row(
                children: [
                  Image.asset(
                    'assets/image_profil.png',
                    width: 43.5,
                    height: 43.5,
                  ),
                  SizedBox(width: 16),
                  Row(
                    children: [
                      Text(
                        "Hello, ",
                        style: blackTextStyle,
                      ),
                      Text(
                        user,
                        style: blackTextStyle.copyWith(
                          fontSize: 11,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Image.asset(
              "assets/icon_notification.png",
              width: 52,
            ),
          ],
        );
      }

      Widget findYourStay() {
        return Container(
          margin: EdgeInsets.only(bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find Your Darshan',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kWhiteColor,
                    ),
                  ),
                  Image.asset(
                    'assets/icon_filter.png',
                    width: 64,
                  ),
                ],
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    children: [
                      TabDestination(
                        imageAsset: "assets/orrisa1.jpg",
                        content: "Orissa",
                      ),
                      SizedBox(width: 28),
                      TabDestination(
                        imageAsset: "assets/tamil_nadu1.jpg",
                        content: "Tamil Nadu",
                      ),
                      SizedBox(width: 28),
                      TabDestination(
                        imageAsset: "assets/punjab1.jpg",
                        content: "Punjab",
                      ),
                      SizedBox(width: 28),
                      TabDestination(
                        imageAsset: "assets/uttar_pradesh1.jpeg",
                        content: "Uttar Pradesh",
                      ),
                      SizedBox(width: 28),
                      TabDestination(
                        imageAsset: "assets/jharkhand1.jpg",
                        content: "Jharkhand",
                      ),
                      SizedBox(width: 28),
                      TabDestination(
                        imageAsset: "assets/image_destination4.png",
                        content: "Bihar",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }

      Widget exploreThese() {
        return StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('locations').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData)
              return const Center(child: CircularProgressIndicator());
            return Container(
              height: 300,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(top: 8.0),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  return PropertyCard(
                      imageUrl: document['image'],
                      title: document['name'],
                      location: document['location']['state'],
                      onClick: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPage(
                                      document['image'],
                                      document['about'],
                                      document['name'],
                                      document['location'],
                                      document['panorama'],
                                    )));
                      });
                }).toList(),
              ),
            );
          },
        );
      }

      Widget popular() {
        return Container(
          margin: EdgeInsets.only(bottom: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    "View All",
                    style: orangeTextStyle,
                  )
                ],
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    children: [
                      PopularCard(
                        imageUrl: "assets/jagannath1.jpg",
                        title: "Jagannath",
                        location: "Orissa",
                      ),
                      SizedBox(width: 15),
                      PopularCard(
                        imageUrl: "assets/bodhgaya1.jpg",
                        title: "Bodhgaya",
                        location: "Bihar",
                      ),
                      SizedBox(width: 23),
                      PopularCard(
                        imageUrl: "assets/ajmer_sharif1.jpg",
                        title: "Ajmer Sharif",
                        location: "Rajasthan",
                      ),
                      SizedBox(width: 23),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }

      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: 23,
            right: 23,
            top: 27,
            bottom: 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextButton(
              //     onPressed: () async {
              //       await _auth.signout();
              //       //  Navigator.pushNamedAndRemoveUntil(
              //       //     context,
              //       //     '/login',
              //       //     (route) => false,
              //       //   );
              //     },
              //     child: Icon(
              //       Icons.shop,
              //       size: 24.0,
              //     )),
              header(),
              findYourStay(),
              exploreThese(),
              popular(),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            content(),
            CustomNavigation(
              home: kOrangeColor,
              market: kdisableOrange,
              bookmarks: kdisableOrange,
              user: kdisableOrange,
            ),
          ],
        ),
      ),
    );
  }
}
