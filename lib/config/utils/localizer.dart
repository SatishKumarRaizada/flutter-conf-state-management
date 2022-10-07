import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localizer {
  final Locale locale;
  Localizer(this.locale);
  static Localizer? of(BuildContext context) {
    return Localizations.of<Localizer>(context, Localizer);
  }

  late Map<String, String> _localizedStrings;
  Future<bool> load() async {
    String jsonString = await rootBundle
        .loadString('assets/locales/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    final value = _localizedStrings[key];
    return value ?? key;
  }

  static const LocalizationsDelegate<Localizer> delegate =
      _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<Localizer> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'es', 'pt', 'fr', 'ka'].contains(locale.languageCode);
  }

  @override
  Future<Localizer> load(Locale locale) async {
    Localizer localizations = Localizer(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localizer> old) {
    return true;
  }
}
