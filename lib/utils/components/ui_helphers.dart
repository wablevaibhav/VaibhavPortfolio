import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UIHelpers {
  static hideKeyBoard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static Widget horizontalSpaceTiny = const SizedBox(width: 5.0);
  static Widget horizontalSpaceSmall = const SizedBox(width: 10.0);
  static Widget horizontalSpaceRegular = const SizedBox(width: 15.0);
  static Widget horizontalSpaceSmallRegular = const SizedBox(width: 20.0);
  static Widget horizontalSpaceMedium = const SizedBox(width: 30.0);
  static Widget horizontalSpaceLarge = const SizedBox(width: 35.0);

  static Widget verticalSpaceTiny = const SizedBox(height: 5.0);
  static Widget verticalSpaceSmall = const SizedBox(height: 10.0);
  static Widget verticalSpaceRegular = const SizedBox(height: 15.0);
  static Widget verticalSpaceMedium = const SizedBox(height: 20.0);
  static Widget verticalSpaceLarge = const SizedBox(height: 35.0);
  static Widget verticalSpaceHuge = const SizedBox(height: 300.0);

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenHeightPercentage(BuildContext context,
          {double percentage = 1}) =>
      screenHeight(context) * percentage;

  static double screenWidthPercentage(BuildContext context,
          {double percentage = 1}) =>
      screenWidth(context) * percentage;

  static Widget spacedDivider({required double spaceHeight}) {
    return Column(
      children: <Widget>[
        verticalSpaceTiny,
        Divider(height: spaceHeight, color: Colors.grey.shade300),
        verticalSpaceTiny,
      ],
    );
  }

  static Widget listDivider = Divider(
    color: Colors.grey.shade400,
    thickness: 1,
  );

  static Widget verticalSpace(double height) => SizedBox(height: height);

  static double screenHeightFraction(BuildContext context,
          {int dividedBy = 1, double offsetBy = 0}) =>
      (screenHeight(context) - offsetBy) / dividedBy;

  static double screenWidthFraction(BuildContext context,
          {int dividedBy = 1, double offsetBy = 0}) =>
      (screenWidth(context) - offsetBy) / dividedBy;

  static double halfScreenWidth(BuildContext context) =>
      screenWidthFraction(context, dividedBy: 2);

  static double thirdScreenWidth(BuildContext context) =>
      screenWidthFraction(context, dividedBy: 3);

  static double getResponsiveFontSize(BuildContext context,
      {double? fontSize, double? max}) {
    max ??= 100;

    var responsiveSize = min(
        screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
        max);

    return responsiveSize;
  }
}
