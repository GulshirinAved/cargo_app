import 'package:flutter/material.dart';

class SharedPrefKeys {
  static const String languageCode = 'languageCode';
  static const String defaultCode = 'tk';
  static const String appLanguage = 'AppLanguage';
}

class Constants {
  static const baseUrl = "http://216.250.11.150/api";
}

class AppConstants {
  static const Locale defaultLocale = Locale('tk');
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('ru', 'RU'),
    Locale('tk', 'TM'),
  ];
}

final List velayat = [
  'Aşgabat',
  'Lebap',
  'Mary',
  'Türkmenbaşy',
  'Daşoguz',
];
final List ids = [
  'D45',
  'D45',
  'BBB',
  'BBB',
  'BBB',
  'BBB',
  'BBB',
  'BBB',
];
