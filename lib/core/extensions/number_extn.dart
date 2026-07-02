import 'package:flutter/material.dart';

extension NumberExtension on num {
  Widget get hBox => SizedBox(height: toDouble());
  Widget get wBox => SizedBox(width: toDouble());

  EdgeInsets get aPad => EdgeInsets.all(toDouble());
  EdgeInsets get hPad => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get vPad => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get lPad => EdgeInsets.only(left: toDouble());
  EdgeInsets get rPad => EdgeInsets.only(right: toDouble());
  EdgeInsets get tPad => EdgeInsets.only(top: toDouble());
  EdgeInsets get bPad => EdgeInsets.only(bottom: toDouble());

  BorderRadius get bRad => BorderRadius.circular(toDouble());
}
