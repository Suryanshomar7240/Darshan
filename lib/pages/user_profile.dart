import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/main.dart';
import 'package:travel_app/services/auth.dart';
import 'package:travel_app/theme.dart';
import 'package:travel_app/widget/navigation.dart';
import 'package:geocoding/geocoding.dart';

class UserProfile extends StatefulWidget {
  var user;

  UserProfile({Key? key, this.user}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState(user: user);
}

class _UserProfileState extends State<UserProfile> {
  var user;
  _UserProfileState({this.user});

  get kBackgroundColor => null;
  final AuthService _auth = AuthService();

  Stream<QuerySnapshot> getUserDataSnapshots(BuildContext context) async* {
    final uid = Home.user.uid;
    yield* FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .collection("basicDetails")
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    Widget ScrollContent() {
      Widget UserLiked() {
        return Container(
          margin: EdgeInsets.only(bottom: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account Settings",
                      style: blackTextStyle.copyWith(
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Icon(
                      Icons.settings,
                    ),
                    TextButton(
                        onPressed: () async {
                          await _auth.signout();

                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/boarding',
                            (route) => false,
                          );
                        },
                        child: Icon(
                          Icons.logout_rounded,
                          size: 24.0,
                          color: kOrangeColor,
                        )),
                  ],
                ),
              ),
            ],
          ),
        );
      }

      Widget userCard() {
        return StreamBuilder(
            stream: getUserDataSnapshots(context),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ), //Border.all
                        boxShadow: [
                          BoxShadow(
                            color: kGreyColor,
                            offset: const Offset(
                              5.0,
                              6.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child:  CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data!.docs[0]['image']),
                          radius: 160,
                          
                        ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          width: double.infinity,
                          child: Column(children: [
                            Text(
                              snapshot.data!.docs[0]['name'],
                              style: const TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 45),
                              child: Row(
                                children: [
                                  Icon(Icons.location_pin, color: kOrangeColor),
                                  Flexible(
                                    child: Text(
                                      snapshot.data!.docs[0]['location']['latitude'].toString()+snapshot.data!.docs[0]['location']['longitude'].toString(),
                                      maxLines: 2,
                                      softWrap: false,
                                      overflow: TextOverflow.fade,
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 120),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: kOrangeColor,
                                  ),
                                  Flexible(
                                    child: Text(
                                      snapshot.data!.docs[0]['phone'],
                                      maxLines: 1,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.mail_sharp,
                                    color: kOrangeColor,
                                  ),
                                  Flexible(
                                    child: Text(
                                      snapshot.data!.docs[0]['email'],
                                      maxLines: 3,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 7),
                          ]),
                        )
                      ]),
                    ),
                    SizedBox(height: 30.0),
                  ],
                ),
              );
            });
      }

      ;

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserLiked(),
            userCard(),
            SizedBox(height: 20.0),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            ScrollContent(),
            CustomNavigation(
              home: kdisableOrange,
              market: kdisableOrange,
              bookmarks: kdisableOrange,
              user: kOrangeColor,
            ),
          ],
        ),
      ),
    );
  }
}
