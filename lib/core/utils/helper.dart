import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  double get topPadding => mediaQuery.padding.top;
  double get bottomPadding => mediaQuery.padding.bottom;
  double get leftPadding => mediaQuery.padding.left;
  double get rightPadding => mediaQuery.padding.right;
  double get textScaleFactor => mediaQuery.textScaleFactor;
  double get devicePixelRatio => mediaQuery.devicePixelRatio;
  Orientation get orientation => mediaQuery.orientation;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  bool get alwaysUse24HourFormat => mediaQuery.alwaysUse24HourFormat;
  Brightness get platformBrightness => mediaQuery.platformBrightness;
  bool get accessibleNavigation => mediaQuery.accessibleNavigation;
}

extension NavigatorHelper on BuildContext {
  Future<T?> push<T>(Widget page) async {
    return await Navigator.of(this)
        .push<T>(CupertinoPageRoute(builder: (context) => page));
  }

  Future<T?> pushReplacement<T>(Widget page) async {
    return await Navigator.of(this)
        .pushReplacement<T, T>(CupertinoPageRoute(builder: (context) => page));
  }

  Future<T?> pushAndRemoveUntil<T>(Widget page) async {
    return await Navigator.of(this).pushAndRemoveUntil<T>(
        CupertinoPageRoute(builder: (context) => page), (route) => false);
  }

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) async {
    return await Navigator.of(this)
        .pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T>(String routeName,
      {Object? arguments}) async {
    return await Navigator.of(this)
        .pushReplacementNamed<T, T>(routeName, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(String routeName, routers,
      {Object? arguments}) async {
    return await Navigator.of(this).pushNamedAndRemoveUntil<T>(
        routeName, (route) => false,
        arguments: arguments);
  }

  void pop<T>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  void popUntilPredicate(RoutePredicate predicate) {
    Navigator.of(this).popUntil(predicate);
  }

  void popAndPushNamed<T>(String routeName, {Object? arguments}) {
    Navigator.of(this).popAndPushNamed<T, T>(routeName, arguments: arguments);
  }
}

extension ThemeHelper on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primaryColor => Theme.of(this).primaryColor;
}

extension TranslationsHelper on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this)!;
}

class Helper {
  static String getLang(BuildContext context) {
    return Localizations.localeOf(context).languageCode;
  }

  // formatDate take date as String and return date as String
  static formatDate(String date) {
    // format date from 2021 - 01 - 01 to 2021 jun 01
    return DateFormat.yMMMd().format(DateTime.parse(date));
  }

  static bool isEmailValid(String email) {
    RegExp emailRegExp = RegExp(r'^[A-Za-z0-9]+@[A-Za-z0-9]+\.[a-z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    RegExp passwordRegExp =
        RegExp(r'^(?=.*[0-9])(?=.*[!$#^*])[A-Za-z0-9!$#^*]{8,}$');
    return passwordRegExp.hasMatch(password);
  }
}
