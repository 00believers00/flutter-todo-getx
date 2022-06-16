import 'dart:ui';

import 'package:get/get.dart';

import '../constants/lang/en_us.dart';
import '../constants/lang/ja_jp.dart';
import '../constants/lang/tr_tr.dart';



class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static const fallbackLocale = Locale('tr', 'TR');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'Türkçe',
    '日本語',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('tr', 'TR'),
    const Locale('ja', 'JP'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'tr_TR': trTR,
        'ja_JP': jaJP,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
