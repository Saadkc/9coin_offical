import 'package:flutter/material.dart';
import '../colors/colors.dart';

class CoinTextStyle {
  static const _baseTextStyle = TextStyle(
    fontFamily: 'Poppins',
    color: CoinColors.white,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get orangeTitle1 {
    return _baseTextStyle.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: CoinColors.dialogTextColor,
    );
  }

  static TextStyle get orangeTitle2 {
    return _baseTextStyle.copyWith(
      fontSize: 16.0,
      color: CoinColors.dialogTextColor,
    );
  }

  static TextStyle get orangeTitle3 {
    return _baseTextStyle.copyWith(
      fontSize: 14.0,
      color: CoinColors.dialogTextColor,
    );
  }

  static TextStyle get orangeTitle4 {
    return _baseTextStyle.copyWith(
      fontSize: 12.0,
      color: CoinColors.dialogTextColor,
    );
  }

  static TextStyle get orangeTitle5 {
    return _baseTextStyle.copyWith(
      fontSize: 10.0,
      color: CoinColors.dialogTextColor,
    );
  }

  static TextStyle get title1 {
    return _baseTextStyle.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
      color: CoinColors.white,
    );
  }

  static TextStyle get title2 {
    return _baseTextStyle.copyWith(
      fontSize: 16.0,
      color: CoinColors.white,
    );
  }

  static TextStyle get title3 {
    return _baseTextStyle.copyWith(
      fontSize: 13.5,
    );
  }

  static TextStyle get title4 {
    return _baseTextStyle.copyWith(
      fontSize: 12.0,
    );
  }

  static TextStyle get title5 {
    return _baseTextStyle.copyWith(
      fontSize: 10.0,
    );
  }

  static TextStyle get title1Bold {
    return _baseTextStyle.copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: CoinColors.white,
    );
  }

  static TextStyle get title2Bold {
    return _baseTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
      color: CoinColors.white,
    );
  }

  static TextStyle get title3Bold {
    return _baseTextStyle.copyWith(
      fontWeight: FontWeight.w700,
      // fontSize: 14.0,
    );
  }

  static TextStyle get title4Bold {
    return _baseTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 12.0,
    );
  }

  static TextStyle get title5Bold {
    return _baseTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 10.0,
    );
  }

  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 46.0,
    );
  }
}
