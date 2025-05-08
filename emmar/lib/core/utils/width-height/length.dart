import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom -
      MediaQuery.of(context).viewInsets.bottom;
}

double getScreenWidthrate(BuildContext context) {
  return getScreenWidth(context) / 392;
}

double getScreenHeightrate(BuildContext context) {
  return getScreenHeight(context) / 783;
}

double getScreenFonttrate(BuildContext context) {
  return (sqrt(
        getScreenHeight(context) * getScreenHeight(context) +
            getScreenWidth(context) * getScreenWidth(context),
      )) /
      875.644;
}
