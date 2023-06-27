// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel_app/theme.dart';
import 'package:travel_app/widget/button.dart';

class OnBoardingPage extends StatelessWidget {
  int? duration = 0;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration!), () async {});

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 240,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_onboarding.png',
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Find your Divinity',
              style: blackTextStyle.copyWith(
                fontSize: 26,
                fontWeight: medium,
                height: 1.25,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 18),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                'Discover your Darshan, explore various pilgrimages, join in live events. We are the agency that helps you provide the most serene and divine ambience at the comfort of your home',
                style: semiBlackTextStyle.copyWith(
                  height: 1.25,
                  fontWeight: regular,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 18),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              width: 243,
              height: 54,
              fontSize: 22,
              content: 'Login',
              onClick: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Button(
              width: 243,
              height: 54,
              fontSize: 22,
              content: 'Sign up',
              onClick: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/signup',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
