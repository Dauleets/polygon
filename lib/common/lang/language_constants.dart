import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String RUSSIAN = 'ru';
const String KAZAKH = 'kk';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences prefs = await sharedPreferences;
  await prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences prefs = await sharedPreferences;
  String languageCode = prefs.getString(LAGUAGE_CODE) ?? RUSSIAN;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, '');
    case RUSSIAN:
      return const Locale(RUSSIAN, '');
    case KAZAKH:
      return const Locale(KAZAKH, '');
    default:
      return const Locale(RUSSIAN, '');
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}
