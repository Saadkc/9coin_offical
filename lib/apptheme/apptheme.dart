import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/typography/text_styles.dart';

class AppTheme {
  static ThemeData get standard {
    return ThemeData.dark().copyWith(
      dialogBackgroundColor: CoinColors.black12,
      dialogTheme: _dialogTheme,
      appBarTheme: _appBarTheme,
      scaffoldBackgroundColor: CoinColors.black,
      elevatedButtonTheme: _elevatedButtonTheme,
      iconTheme: _iconTheme,
      inputDecorationTheme: _inputDecorationTheme,
      bottomNavigationBarTheme: _bottomNavigationBarThemeData,
      navigationBarTheme: _navigationBarThemeData,
      dividerTheme: _dividerThemeData,
    );
  }

  static get _dividerThemeData {
    return const DividerThemeData(
      color: CoinColors.black26,
      thickness: 1.6,
    );
  }

  static get _dialogTheme {
    return const DialogTheme();
  }

  static get _navigationBarThemeData {
    return NavigationBarThemeData(
      labelTextStyle: MaterialStateProperty.all(CoinTextStyle.title4),
      indicatorColor: CoinColors.transparent,
      backgroundColor: CoinColors.blackMedium2,
    );
  }

  static get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: CoinColors.orange,
        fixedSize: const Size(0, 45),
      ),
    );
  }

  static get _iconTheme {
    return const IconThemeData(
      color: CoinColors.orange,
      size: 20,
    );
  }

  static get _inputDecorationTheme {
    return InputDecorationTheme(
      fillColor: CoinColors.black12,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide.none,
      ),
      hintStyle: CoinTextStyle.title3.copyWith(color: CoinColors.black54),
    );
  }

  static get _bottomNavigationBarThemeData {
    return BottomNavigationBarThemeData(
      backgroundColor: CoinColors.blackMedium2,
      elevation: 120,
      selectedLabelStyle: CoinTextStyle.title4,
      unselectedLabelStyle: CoinTextStyle.title4,
      selectedItemColor: CoinColors.orange,
      unselectedItemColor: CoinColors.white,
    );
  }

  static get _appBarTheme {
    return AppBarTheme(
      titleTextStyle: CoinTextStyle.title1Bold,
      backgroundColor: CoinColors.black12,
      elevation: 0,
    );
  }
}
