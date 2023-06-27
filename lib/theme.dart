import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimaryColor = Color(0xffF05A22);

Color kOrangeColor = Color(0xffF05A22);
Color kdisableOrange = Color.fromARGB(255, 255, 190, 182);
const Color kBlackColor = Color(0xff2D2D2D);
Color kSemiBlackColor = Color(0xff595959);
const Color kGreyColor = Color(0xff898989);
const Color kWhiteColor = Color(0xffFFFFFF);
Color kBackgroundColor = Color(0xffF5F5F5);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

TextStyle orangeTextStyle = GoogleFonts.nunito(
  color: kOrangeColor,
);

const TextStyle blackTextStyle = TextStyle(
  fontFamily: 'TechnaSans',
  color: kBlackColor,
);

TextStyle semiBlackTextStyle = TextStyle(
  fontFamily: 'Gordita',
  color: kSemiBlackColor,
);

const TextStyle whiteTextStyle = TextStyle(
  fontFamily: 'TechnaSans',
  color: kWhiteColor,
);

TextStyle greyTextStyle = TextStyle(
  fontFamily: 'TechnaSans',
  color: kGreyColor,
);
