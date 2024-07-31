import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/date_symbol_data_custom.dart' as date_symbol_data_custom;
// ignore: depend_on_referenced_packages
import 'package:intl/date_symbols.dart' as intl;
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart' as intl;

import '../application/settings_singleton.dart';
import '../design/constants.dart';

const _tkDatePatterns = {
  'd': 'd',
  'E': 'ccc',
  'EEEE': 'cccc',
  'LLL': 'LLL',
  'LLLL': 'LLLL',
  'M': 'L',
  'Md': 'dd/MM',
  'MEd': 'EEE, dd/MM',
  'MMM': 'LLL',
  'MMMd': 'd MMM',
  'MMMEd': 'EEE, d MMM',
  'MMMM': 'LLLL',
  'MMMMd': 'd MMMM',
  'MMMMEEEEd': 'EEEE, d MMMM',
  'QQQ': 'QQQ',
  'QQQQ': 'QQQQ',
  'y': 'y',
  'yM': 'MM/y',
  'yMd': 'dd/MM/y',
  'yMEd': 'EEE, dd/MM/y',
  'yMMM': 'MMM y',
  'yMMMd': 'd MMM y',
  'yMMMEd': 'EEE, d MMM y',
  'yMMMM': 'MMMM y',
  'yMMMMd': 'd MMMM y',
  'yMMMMEEEEd': 'EEEE, d MMMM y',
  'yQQQ': 'QQQ y',
  'yQQQQ': 'QQQQ y',
  'H': 'HH',
  'Hm': 'HH:mm',
  'Hms': 'HH:mm:ss',
  'j': 'HH',
  'jm': 'HH:mm',
  'jms': 'HH:mm:ss',
  'jmv': 'HH:mm v',
  'jmz': 'HH:mm z',
  'jz': 'HH z',
  'm': 'm',
  'ms': 'mm:ss',
  's': 's',
  'v': 'v',
  'z': 'z',
  'zzzz': 'zzzz',
  'ZZZZ': 'ZZZZ',
};

const _tkSymbols = {
  'NAME': 'tk',
  'ERAS': ['BC', 'AD'],
  'ERANAMES': ['Before Christ', 'Anno Domini'],
  'NARROWMONTHS': ['Ý', 'F', 'M', 'A', 'M', 'I', 'I', 'A', 'S', 'O', 'N', 'D'],
  'STANDALONENARROWMONTHS': [
    'Ý',
    'F',
    'M',
    'A',
    'M',
    'I',
    'I',
    'A',
    'S',
    'O',
    'N',
    'D',
  ],
  'MONTHS': [
    'Ýanwar',
    'Fewral',
    'Mart',
    'Aprel',
    'Maý',
    'Iýun',
    'Iýul',
    'Awgust',
    'Sentýabr',
    'Oktýabr',
    'Noýabr',
    'Dekabr',
  ],
  'STANDALONEMONTHS': [
    'Ýanwar',
    'Fewral',
    'Mart',
    'Aprel',
    'Maý',
    'Iýun',
    'Iýul',
    'Awgust',
    'Sentýabr',
    'Oktýabr',
    'Noýabr',
    'Dekabr',
  ],
  'SHORTMONTHS': [
    'Ýan',
    'Few',
    'Mar',
    'Apr',
    'Maý',
    'Iýu',
    'Iýl',
    'Awg',
    'Sen',
    'Okt',
    'Noý',
    'Dek',
  ],
  'STANDALONESHORTMONTHS': [
    'Ýan',
    'Few',
    'Mar',
    'Apr',
    'Maý',
    'Iýu',
    'Iýl',
    'Awg',
    'Sen',
    'Okt',
    'Noý',
    'Dek',
  ],
  'WEEKDAYS': [
    'Ýekşenbe',
    'Duşenbe',
    'Sişenbe',
    'Çarşenbe',
    'Penşenbe',
    'Anna',
    'Şenbe',
  ],
  'STANDALONEWEEKDAYS': [
    'Ýekşenbe',
    'Duşenbe',
    'Sişenbe',
    'Çarşenbe',
    'Penşenbe',
    'Anna',
    'Şenbe',
  ],
  'SHORTWEEKDAYS': ['Ýek', 'Duş', 'Siş', 'Çar', 'Pen', 'Ann', 'Şen'],
  'STANDALONESHORTWEEKDAYS': ['Ýek', 'Duş', 'Siş', 'Çar', 'Pen', 'Ann', 'Şen'],
  'NARROWWEEKDAYS': ['Ý', 'D', 'S', 'Ç', 'P', 'A', 'Ş'],
  'STANDALONENARROWWEEKDAYS': ['Ý', 'D', 'S', 'Ç', 'P', 'A', 'Ş'],
  'SHORTQUARTERS': ['K1', 'K2', 'K3', 'K4'],
  'QUARTERS': [
    '1-nji kwartal',
    '2-nji kwartal',
    '3-nji kwartal',
    '4-nji kwartal',
  ],
  'AMPMS': ['am', 'pm'],
  'DATEFORMATS': ['EEEE, d MMMM y', 'd MMMM y', 'd MMM y', 'dd/MM/y'],
  'TIMEFORMATS': ['HH:mm:ss zzzz', 'HH:mm:ss z', 'HH:mm:ss', 'HH:mm'],
  'AVAILABLEFORMATS': null,
  'FIRSTDAYOFWEEK': 0,
  'WEEKENDRANGE': [6],
  'FIRSTWEEKCUTOFFDAY': 3,
  'DATETIMEFORMATS': ['{1}, {0}', '{1}, {0}', '{1}, {0}', '{1}, {0}'],
};

const List<String> _shortWeekdays = <String>[
  'Duş',
  'Siş',
  'Çar',
  'Pen',
  'Ann',
  'Şen',
  'Ýek',
];

const List<String> _shortMonths = <String>[
  'Ýan',
  'Few',
  'Mar',
  'Apr',
  'Maý',
  'Iýn',
  'Iýl',
  'Awg',
  'Sen',
  'Okt',
  'Noý',
  'Dek',
];

const List<String> _months = <String>[
  'Ýanwar',
  'Fewral',
  'Mart',
  'Aprel',
  'Maý',
  'Iýun',
  'Iýul',
  'Awgust',
  'Sentýabr',
  'Oktýabr',
  'Noýabr',
  'Dekabr',
];

extension L10n on String {
  String get trs {
    String? result = AppLocalizations(null).translate(this);

    /// Checking if applocalization is loading future data
    /// and result can be null else null then it is not
    /// found in translation map
    result ??= AppLocalizations.templocalizedStrings[this];

    return result ?? this;
  }
}

class AppLocalizations {
  static AppLocalizations _instance = AppLocalizations._(AppConstants.defaultLocale);

  factory AppLocalizations(Locale? locale) {
    if (locale != null && locale != _instance.locale) {
      /// _localizedStrings can be empty a little time when
      /// loading json data, and we will take it's old value
      /// into templocalizedStrings
      templocalizedStrings = _instance._localizedStrings;
      _instance = AppLocalizations._(locale);
      return _instance;
    }
    return _instance;
  }
  AppLocalizations._(this.locale);
  final Locale locale;

  /// This static temporary localized strings used for
  /// avoid null _localizedStrings, because it can be null
  /// when applocalization delegate loads translations from
  /// json file
  static Map<String, String> templocalizedStrings = {};

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings = {};

  Future<bool> load() async {
    final String jsonString = await rootBundle.loadString('assets/languages/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String? translate(String key) {
    final String? result = _localizedStrings[key];
    return result;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ru', 'tk'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localizations = AppLocalizations(SettingsSingleton().locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}

// class TmMaterialLocalization extends MaterialLocalizations {}
class _TmCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _TmCupertinoLocalizationsDelegate();

  @override
  Future<TmCupertinoLocalizations> load(Locale locale) async {
    final String localeName = intl.Intl.canonicalizedLocale('tk'.toString());

    // The locale (in this case `nn`) needs to be initialized into the custom
    // date symbols and patterns setup that Flutter uses.
    date_symbol_data_custom.initializeDateFormattingCustom(
      locale: localeName,
      patterns: _tkDatePatterns,
      symbols: intl.DateSymbols.deserializeFromMap(_tkSymbols),
    );

    final singleDigitHourFormat = intl.DateFormat('HH', localeName);
    final singleDigitMinuteFormat = intl.DateFormat.m(localeName);
    final singleDigitSecondFormat = intl.DateFormat.s(localeName);
    final dayFormat = intl.DateFormat.d(localeName);
    return SynchronousFuture<TmCupertinoLocalizations>(
      TmCupertinoLocalizations(
        localeName: localeName,
        decimalFormat: intl.NumberFormat('#,##0.###', 'en_US'),
        fullYearFormat: intl.DateFormat('y', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        singleDigitHourFormat: singleDigitHourFormat,
        doubleDigitMinuteFormat: singleDigitMinuteFormat,
        dayFormat: dayFormat,
        singleDigitMinuteFormat: singleDigitMinuteFormat,
        singleDigitSecondFormat: singleDigitSecondFormat,
      ),
    );
  }

  @override
  bool isSupported(Locale locale) => locale.countryCode == 'TM' && locale.languageCode == 'tk';

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<CupertinoLocalizations> old,
  ) {
    return false;
  }
}

class _TmMaterialLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
  const _TmMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.countryCode == 'TM' && locale.languageCode == 'tk';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    const String localeName = 'en_US';
    return SynchronousFuture<TmMaterialLocalizations>(
      TmMaterialLocalizations(
        localeName: localeName,
        fullYearFormat: intl.DateFormat('y', localeName),
        compactDateFormat: intl.DateFormat('yMd', localeName),
        shortDateFormat: intl.DateFormat('yMMMd', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        longDateFormat: intl.DateFormat('EEEE, MMMM d, y', localeName),
        yearMonthFormat: intl.DateFormat('MMMM y', localeName),
        shortMonthDayFormat: intl.DateFormat('MMM d'),
        decimalFormat: intl.NumberFormat('#,##0.###'),
        twoDigitZeroPaddedFormat: intl.NumberFormat('00'),
      ),
    );
  }

  @override
  bool shouldReload(_TmMaterialLocalizationsDelegate old) {
    return false;
  }
}

class TmCupertinoLocalizations extends GlobalCupertinoLocalizations {
  const TmCupertinoLocalizations({
    required intl.DateFormat fullYearFormat,
    required intl.DateFormat dayFormat,
    required intl.DateFormat mediumDateFormat,
    required intl.DateFormat singleDigitHourFormat,
    required intl.DateFormat singleDigitMinuteFormat,
    required intl.DateFormat doubleDigitMinuteFormat,
    required intl.DateFormat singleDigitSecondFormat,
    required intl.NumberFormat decimalFormat,
    String localeName = 'tk',
  }) : super(
          localeName: localeName,
          fullYearFormat: fullYearFormat,
          dayFormat: dayFormat,
          mediumDateFormat: mediumDateFormat,
          singleDigitHourFormat: singleDigitHourFormat,
          singleDigitMinuteFormat: singleDigitMinuteFormat,
          doubleDigitMinuteFormat: doubleDigitMinuteFormat,
          singleDigitSecondFormat: singleDigitSecondFormat,
          decimalFormat: decimalFormat,
        );

  static const LocalizationsDelegate<CupertinoLocalizations> delegate = _TmCupertinoLocalizationsDelegate();

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  // @override
  // String datePickerDayOfMonth(int dayIndex) => dayIndex.toString();

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => '$hour sagat';

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    return '$minute minut';
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return '${_shortWeekdays[date.weekday - DateTime.monday]} '
        '${_shortMonths[date.month - DateTime.january]} '
        '${date.day.toString().padRight(2)}';
  }

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder => DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get todayLabel => 'Şu gün';

  @override
  String get alertDialogLabel => 'Üns beriň';

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    assert(tabIndex >= 1);
    assert(tabCount >= 1);
    return '$tabCount arasynda $tabIndex-nji jübi';
  }

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => hour == 1 ? 'sagat' : 'sagat';

  @override
  List<String> get timerPickerHourLabels => const <String>['sagat', 'sagat'];

  @override
  String timerPickerMinuteLabel(int minute) => 'min.';

  @override
  List<String> get timerPickerMinuteLabels => const <String>['min.'];

  @override
  String timerPickerSecondLabel(int second) => 'sek.';

  @override
  List<String> get timerPickerSecondLabels => const <String>['sek.'];

  @override
  String get cutButtonLabel => 'Kesmek';

  @override
  String get copyButtonLabel => 'Kopiýala';

  @override
  String get pasteButtonLabel => 'Giriz';

  @override
  String get selectAllButtonLabel => 'Hemmesini saýla';

  @override
  String get searchTextFieldPlaceholderLabel => 'Gözle';

  @override
  String get modalBarrierDismissLabel => 'Ýap';

  @override
  String get datePickerDateOrderString => 'dmy';

  @override
  String get datePickerDateTimeOrderString => 'date_time_dayPeriod';

  @override
  String? get datePickerHourSemanticsLabelFew => r'$hour sagat';

  @override
  String? get datePickerHourSemanticsLabelMany => r'$hour sagat';

  @override
  String get tabSemanticsLabelRaw => r'$tabCount arasynda $tabIndex-nji jübi';

  @override
  String get timerPickerHourLabelOther => 'sagat';

  @override
  String get timerPickerMinuteLabelOther => 'min.';

  @override
  String get timerPickerSecondLabelOther => 'sеk.';

  @override
  String get datePickerHourSemanticsLabelOther => r'$hour sagat';

  @override
  String get datePickerMinuteSemanticsLabelOther => r'$minute minut';

  @override
  // TODO: implement clearButtonLabel
  String get clearButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement lookUpButtonLabel
  String get lookUpButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement menuDismissLabel
  String get menuDismissLabel => throw UnimplementedError();

  @override
  // TODO: implement noSpellCheckReplacementsLabel
  String get noSpellCheckReplacementsLabel => throw UnimplementedError();

  @override
  // TODO: implement searchWebButtonLabel
  String get searchWebButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement shareButtonLabel
  String get shareButtonLabel => throw UnimplementedError();
}

class TmMaterialLocalizations extends GlobalMaterialLocalizations {
  const TmMaterialLocalizations({
    required intl.DateFormat fullYearFormat,
    required intl.DateFormat compactDateFormat,
    required intl.DateFormat shortDateFormat,
    required intl.DateFormat mediumDateFormat,
    required intl.DateFormat longDateFormat,
    required intl.DateFormat yearMonthFormat,
    required intl.DateFormat shortMonthDayFormat,
    required intl.NumberFormat decimalFormat,
    required intl.NumberFormat twoDigitZeroPaddedFormat,
    String localeName = 'tk',
  }) : super(
          localeName: localeName,
          fullYearFormat: fullYearFormat,
          compactDateFormat: compactDateFormat,
          shortDateFormat: shortDateFormat,
          mediumDateFormat: mediumDateFormat,
          longDateFormat: longDateFormat,
          yearMonthFormat: yearMonthFormat,
          shortMonthDayFormat: shortMonthDayFormat,
          decimalFormat: decimalFormat,
          twoDigitZeroPaddedFormat: twoDigitZeroPaddedFormat,
        );

  @override
  String get keyboardKeyAlt => 'Alt';
  @override
  String get keyboardKeyAltGraph => 'AltGr';
  @override
  String get keyboardKeyBackspace => 'Backspace';
  @override
  String get keyboardKeyCapsLock => 'Caps Lock';
  @override
  String get keyboardKeyChannelDown => 'Channel Down';
  @override
  String get keyboardKeyChannelUp => 'Channel Up';
  @override
  String get keyboardKeyControl => 'Ctrl';
  @override
  String get keyboardKeyDelete => 'Del';
  @override
  String get keyboardKeyEject => 'Eject';
  @override
  String get keyboardKeyEnd => 'End';
  @override
  String get keyboardKeyEscape => 'Esc';
  @override
  String get keyboardKeyFn => 'Fn';
  @override
  String get keyboardKeyHome => 'Home';
  @override
  String get keyboardKeyInsert => 'Insert';
  @override
  String get keyboardKeyMeta => 'Meta';
  @override
  String get keyboardKeyMetaMacOs => 'Command';
  @override
  String get keyboardKeyMetaWindows => 'Win';
  @override
  String get keyboardKeyNumLock => 'Num Lock';
  @override
  String get keyboardKeyNumpad1 => 'Num 1';
  @override
  String get keyboardKeyNumpad2 => 'Num 2';
  @override
  String get keyboardKeyNumpad3 => 'Num 3';
  @override
  String get keyboardKeyNumpad4 => 'Num 4';
  @override
  String get keyboardKeyNumpad5 => 'Num 5';
  @override
  String get keyboardKeyNumpad6 => 'Num 6';
  @override
  String get keyboardKeyNumpad7 => 'Num 7';
  @override
  String get keyboardKeyNumpad8 => 'Num 8';
  @override
  String get keyboardKeyNumpad9 => 'Num 9';
  @override
  String get keyboardKeyNumpad0 => 'Num 0';
  @override
  String get keyboardKeyNumpadAdd => 'Num +';
  @override
  String get keyboardKeyNumpadComma => 'Num ,';
  @override
  String get keyboardKeyNumpadDecimal => 'Num .';
  @override
  String get keyboardKeyNumpadDivide => 'Num /';
  @override
  String get keyboardKeyNumpadEnter => 'Num Enter';
  @override
  String get keyboardKeyNumpadEqual => 'Num =';
  @override
  String get keyboardKeyNumpadMultiply => 'Num *';
  @override
  String get keyboardKeyNumpadParenLeft => 'Num (';
  @override
  String get keyboardKeyNumpadParenRight => 'Num )';
  @override
  String get keyboardKeyNumpadSubtract => 'Num -';
  @override
  String get keyboardKeyPageDown => 'PgDown';
  @override
  String get keyboardKeyPageUp => 'PgUp';
  @override
  String get keyboardKeyPower => 'Power';
  @override
  String get keyboardKeyPowerOff => 'Power Off';
  @override
  String get keyboardKeyPrintScreen => 'Print Screen';
  @override
  String get keyboardKeyScrollLock => 'Scroll Lock';
  @override
  String get keyboardKeySelect => 'Select';
  @override
  String get keyboardKeySpace => 'Space';

  @override
  String get moreButtonTooltip => r'Giňişleýin';

  @override
  String get firstPageTooltip => 'Baş sahypa';

  @override
  String get lastPageTooltip => 'Soňky sahypa';

  @override
  String get aboutListTileTitleRaw => r'$applicationName hakda';

  @override
  String get alertDialogLabel => r'Üns beriň';

  @override
  String get anteMeridiemAbbreviation => r'AM';

  @override
  String get backButtonTooltip => r'Dolan';

  @override
  String get cancelButtonLabel => r'ÖÇÜR';

  @override
  String get closeButtonLabel => r'ÝAPMAK';

  @override
  String get closeButtonTooltip => r'Ýapmak';

  @override
  String get collapsedIconTapHint => r'Giňelt';

  @override
  String get continueButtonLabel => r'DOWAM ET';

  @override
  String get copyButtonLabel => r'GÖÇÜR';

  @override
  String get cutButtonLabel => r'KES';

  @override
  String get deleteButtonTooltip => r'Poz';

  @override
  String get dialogLabel => r'Dialog';

  @override
  String get drawerLabel => r'Nawigasiýa menýusy';

  @override
  String get expandedIconTapHint => r'Kiçelt';

  @override
  String get hideAccountsLabel => r'Akkaundy gizle';

  @override
  String get licensesPageTitle => r'Lisenziýalar';

  @override
  String get modalBarrierDismissLabel => r'Ýap';

  @override
  String get nextMonthTooltip => r'Indiki aý';

  @override
  String get nextPageTooltip => r'Indiki sahypa';

  @override
  String get okButtonLabel => r'OK';

  @override
  String get openAppDrawerTooltip => r'Menýu çekmesi';

  @override
  String get pageRowsInfoTitleRaw => r'$firstRow–$lastRow of $rowCount';

  @override
  String get pageRowsInfoTitleApproximateRaw => r'$firstRow–$lastRow of about $rowCount';

  @override
  String get pasteButtonLabel => r'GIRIZ';

  @override
  String get popupMenuLabel => r'Popup menýu';

  @override
  String get postMeridiemAbbreviation => r'PM';

  @override
  String get previousMonthTooltip => r'Öňki aý';

  @override
  String get previousPageTooltip => r'Öňki sahypa';

  @override
  String get refreshIndicatorSemanticLabel => r'Täzele';

  @override
  String? get remainingTextFieldCharacterCountFew => null;

  @override
  String? get remainingTextFieldCharacterCountMany => null;

  @override
  String get remainingTextFieldCharacterCountOne => r'1 harp galdy';

  @override
  String get remainingTextFieldCharacterCountOther => r'$remainingCount harplar galdy';

  @override
  String? get remainingTextFieldCharacterCountTwo => null;

  @override
  String get remainingTextFieldCharacterCountZero => r'Hiç harp galmady';

  @override
  String get reorderItemDown => r'Aşak geçir';

  @override
  String get reorderItemLeft => r'Çepe geçir';

  @override
  String get reorderItemRight => r'Saga geçir';

  @override
  String get reorderItemToEnd => r'Soňuna geçir';

  @override
  String get reorderItemToStart => r'Başyna geçir';

  @override
  String get reorderItemUp => r'Yokary geçir';

  @override
  String get rowsPerPageTitle => r'Sahypa başyna hatar:';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => r'Gözle...';

  @override
  String get selectAllButtonLabel => r'HEMMESINI SAÝLA';

  @override
  String? get selectedRowCountTitleFew => null;

  @override
  String? get selectedRowCountTitleMany => null;

  @override
  String get selectedRowCountTitleOne => r'1 element saýlandy';

  @override
  String get selectedRowCountTitleOther => r'$selectedRowCount elementler saýlandy';

  @override
  String? get selectedRowCountTitleTwo => null;

  @override
  String get selectedRowCountTitleZero => r'Hiç element saýlanmady';

  @override
  String get showAccountsLabel => r'Akkauntlary aç';

  @override
  String get showMenuTooltip => r'Menýuny aç';

  @override
  String get signedInLabel => r'Ulgamda';

  @override
  String get tabLabelRaw => r'$tabCount içinden $tabIndex tab';

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.h_colon_mm_space_a;

  @override
  String get timePickerHourModeAnnouncement => r'Sagady saýlaň';

  @override
  String get timePickerMinuteModeAnnouncement => r'Minudy saýlaň';

  @override
  String get viewLicensesButtonLabel => r'LISENZIÝALARY GÖRKEZ';

  @override
  List<String> get narrowWeekdays => const <String>['Ý', 'D', 'S', 'Ç', 'P', 'A', 'Ş'];

  @override
  int get firstDayOfWeekIndex => 0;

  static const LocalizationsDelegate<MaterialLocalizations> delegate = _TmMaterialLocalizationsDelegate();

  @override
  String get calendarModeButtonLabel => r'Senenama geç';

  @override
  String get dateHelpText => r'mm/dd/yyyy';

  @override
  String get dateInputLabel => r'Senesini giriziň';

  @override
  String get dateOutOfRangeLabel => r'Aralykdan geçdi.';

  @override
  String get datePickerHelpText => r'SENESINI SAÝLAŇ';

  @override
  String get dateRangeEndDateSemanticLabelRaw => r'Gutarýan sene $fullDate';

  @override
  String get dateRangeEndLabel => r'Gutarýan sene';

  @override
  String get dateRangePickerHelpText => 'SENE ARALYGY';

  @override
  String get dateRangeStartDateSemanticLabelRaw => 'Başlangyç sene \$fullDate';

  @override
  String get dateRangeStartLabel => 'Başlangyç sene';

  @override
  String get dateSeparator => '/';

  @override
  String get dialModeButtonLabel => 'Belgi saýlaýyja geçmek';

  @override
  String get inputDateModeButtonLabel => 'Girizmege geç';

  @override
  String get inputTimeModeButtonLabel => 'Tekst girizmege geç';

  @override
  String get invalidDateFormatLabel => 'Ýalňyş format.';

  @override
  String get invalidDateRangeLabel => 'Ýalňyş format.';

  @override
  String get invalidTimeLabel => 'Dogry wagty giriziň';

  @override
  String get licensesPackageDetailTextOther => '\$licenseCount licenses';

  @override
  String get saveButtonLabel => 'ÝATLA';

  @override
  String get selectYearSemanticsLabel => 'Ýyly saýlaň';

  @override
  String get timePickerDialHelpText => 'WAGTY SAÝLAŇ';

  @override
  String get timePickerHourLabel => 'Sagat';

  @override
  String get timePickerInputHelpText => 'WAGTY GIRIZIŇ';

  @override
  String get timePickerMinuteLabel => 'Minut';

  @override
  String get unspecifiedDate => 'Sene';

  @override
  String get menuBarMenuLabel => 'Menýu ady';

  @override
  String get unspecifiedDateRange => 'Sene aralygy';

  @override
  // TODO: implement bottomSheetLabel
  String get bottomSheetLabel => throw UnimplementedError();

  @override
  // TODO: implement clearButtonTooltip
  String get clearButtonTooltip => throw UnimplementedError();

  @override
  // TODO: implement collapsedHint
  String get collapsedHint => throw UnimplementedError();

  @override
  // TODO: implement currentDateLabel
  String get currentDateLabel => throw UnimplementedError();

  @override
  // TODO: implement expandedHint
  String get expandedHint => throw UnimplementedError();

  @override
  // TODO: implement expansionTileCollapsedHint
  String get expansionTileCollapsedHint => throw UnimplementedError();

  @override
  // TODO: implement expansionTileCollapsedTapHint
  String get expansionTileCollapsedTapHint => throw UnimplementedError();

  @override
  // TODO: implement expansionTileExpandedHint
  String get expansionTileExpandedHint => throw UnimplementedError();

  @override
  // TODO: implement expansionTileExpandedTapHint
  String get expansionTileExpandedTapHint => throw UnimplementedError();

  @override
  // TODO: implement keyboardKeyShift
  String get keyboardKeyShift => throw UnimplementedError();

  @override
  // TODO: implement lookUpButtonLabel
  String get lookUpButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement menuDismissLabel
  String get menuDismissLabel => throw UnimplementedError();

  @override
  // TODO: implement scanTextButtonLabel
  String get scanTextButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement scrimLabel
  String get scrimLabel => throw UnimplementedError();

  @override
  // TODO: implement scrimOnTapHintRaw
  String get scrimOnTapHintRaw => throw UnimplementedError();

  @override
  // TODO: implement searchWebButtonLabel
  String get searchWebButtonLabel => throw UnimplementedError();

  @override
  // TODO: implement selectedDateLabel
  String get selectedDateLabel => throw UnimplementedError();

  @override
  // TODO: implement shareButtonLabel
  String get shareButtonLabel => throw UnimplementedError();
}
