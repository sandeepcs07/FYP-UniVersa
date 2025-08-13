import 'dart:math';

import 'package:flutter/material.dart';

const double _tinySize = 5.0;
const double _smallSize = 10.0;
const double _mediumSize = 25.0;
const double _largeSize = 50.0;
const double _massiveSize = 120.0;

const double fontSize2 = 2.0;
const double fontSize4 = 4.0;
const double fontSize6 = 6.0;
const double fontSize8 = 8.0;
const double fontSize10 = 10.0;
const double fontSize12 = 12.0;
const double fontSize14 = 14.0;
const double fontSize16 = 16.0;
const double fontSize18 = 18.0;
const double fontSize20 = 20.0;
const double fontSize22 = 22.0;
const double fontSize24 = 24.0;
const double fontSize26 = 26.0;
const double fontSize28 = 28.0;
const double fontSize30 = 30.0;

const Widget horizontalSpaceTiny = SizedBox(width: _tinySize);
const Widget horizontalSpaceSmall = SizedBox(width: _smallSize);
const Widget horizontalSpaceMedium = SizedBox(width: _mediumSize);
const Widget horizontalSpaceLarge = SizedBox(width: _largeSize);

const Widget verticalSpaceTiny = SizedBox(height: _tinySize);
const Widget verticalSpaceSmall = SizedBox(height: _smallSize);
const Widget verticalSpaceMedium = SizedBox(height: _mediumSize);
const Widget verticalSpaceLarge = SizedBox(height: _largeSize);
const Widget verticalSpaceMassive = SizedBox(height: _massiveSize);

Widget spacedDivider = const Column(
  children: <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenWidthCustom(BuildContext context, double val) {
  return screenWidth(context) * val;
}

double screenHeightCustom(BuildContext context, double val) {
  return screenHeight(context) * val;
}

double screenHeightFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(BuildContext context,
        {int dividedBy = 1, double offsetBy = 0, double max = 3000}) =>
    min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

double getResponsiveHorizontalSpaceMedium(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 10);
double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

double getResponsiveFontSize(BuildContext context,
    {double? fontSize, double? max}) {
  max ??= 100;

  var responsiveSize = min(
      screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
      max);

  return responsiveSize;
}

RegExp getRegExpint() {
  return RegExp('[0-9]');
}

RegExp getRegExpstring() {
  return RegExp('[a-zA-Z ]');
}

bool lightdark(BuildContext context) {
  Brightness brightness = Theme.of(context).brightness;
  if (brightness == Brightness.light) {
    return true;
  } else {
    return false;
  }
}
