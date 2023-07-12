import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';

const String langCode = 'languageCode';

//languages code
const String english = 'en';
const String russian = 'ru';
const String kazakh = 'kk';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await sharedPreferences;
  await prefs.setString(langCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await sharedPreferences;
  String languageCode = prefs.getString(langCode) ?? russian;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case english:
      return const Locale(english, '');
    case russian:
      return const Locale(russian, '');
    case kazakh:
      return const Locale(kazakh, '');
    default:
      return const Locale(russian, '');
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}
