import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

List supportedLanguages = ['en', 'fr', 'es', 'it'];

class Internationalization {
  final Map<String, Map<String, String>> localizedValues;

  Internationalization(this.locale, this.localizedValues);

  Locale locale;

  static Internationalization of(BuildContext context) {
    return Localizations.of<Internationalization>(
        context, Internationalization);
  }

  greetTo(name) => localizedValues[locale.languageCode][name];
}

class InternationalizationDelegate
    extends LocalizationsDelegate<Internationalization> {
  Map<String, Map<String, String>> localizedValues;

  InternationalizationDelegate(this.localizedValues);

  @override
  bool isSupported(Locale locale) =>
      supportedLanguages.contains(locale.languageCode);

  @override
  Future<Internationalization> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of Internationalization.
    return SynchronousFuture<Internationalization>(
        Internationalization(locale, localizedValues));
  }

  @override
  bool shouldReload(InternationalizationDelegate old) => false;
}
