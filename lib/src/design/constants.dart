import 'package:flutter/material.dart';

class SharedPrefKeys {
  static const String languageCode = 'languageCode';
  static const String defaultCode = 'tk';
  static const String appLanguage = 'AppLanguage';
}

class Constants {
  // static const baseUrl = "http://216.250.11.150/api";
  static const baseUrl = 'https://106cargo.com.tm/api';
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
const BorderRadius borderRadius5 = BorderRadius.all(Radius.circular(5));
const BorderRadius borderRadius10 = BorderRadius.all(Radius.circular(10));
const BorderRadius borderRadius15 = BorderRadius.all(Radius.circular(15));
const BorderRadius borderRadius20 = BorderRadius.all(Radius.circular(20));
const BorderRadius borderRadius25 = BorderRadius.all(Radius.circular(25));
const BorderRadius borderRadius30 = BorderRadius.all(Radius.circular(30));
const BorderRadius borderRadius40 = BorderRadius.all(Radius.circular(40));
const BorderRadius borderRadius50 = BorderRadius.all(Radius.circular(50));
