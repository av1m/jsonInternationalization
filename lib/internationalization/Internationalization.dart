import 'dart:async';

import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

/// All languages ​​that the application supports
/// This variable is used to recover JSON files
/// To retrieve a language file, the name of that file need to be in this list
///
/// For example if I have a language file named "fr.json"
/// My variable will be `List supportedLanguages ​​= ['fr',];
List supportedLanguages = ['en', 'fr', 'es', 'it'];

/// # Manage Flutter Internationalization (with JSON)
/// 
/// Flutter project example to manage internationalization (different languages) using JSON file
/// 
/// ## How to
/// 
/// * Copy the directory `lib/internalialization/` in your `lib/` directory
///   
/// * Create all translation files (with the same keys) in the i18n folder.  
///   
///   The name of each file should be the same as the one contained in the `supportedLanguages` variable (List) in the `lib/ internationalization/internationalization.dart` file
/// 
/// * Add these lines in the `pubspec.yaml` file :  
///   
/// ```dart
/// dev_dependencies:
///   flutter_test:
///     sdk: flutter
///   flutter_localizations: # ADD THIS
///     sdk: flutter # ADD THIS
/// 
/// flutter:
///     assets:
///         - lib/internationalization/i18n/
/// ```
/// 
/// * After that you can use this :
/// 
/// ```dart
/// // ADD THIS IMPORT 
/// import 'package:flutter_localizations/flutter_localizations.dart';
/// 
/// // ADD THIS IN YOUR MAIN CLASS
/// import 'internationalization/init_i18n.dart';
/// Map<String, Map<String, String>> localizedValues = await initializeI18n();
/// 
/// // ADD THIS IN YOUR MATERIAL APP
/// localizationsDelegates: [
///     InternationalizationDelegate(this.localizedValues),
///     GlobalMaterialLocalizations.delegate,
///     GlobalWidgetsLocalizations.delegate,
/// ],
/// supportedLocales: supportedLanguages.map(
///     (language) => Locale(language, '')
/// ),
/// ```
/// 
/// * **OR** in another way (using FutureBuilder):
/// 
/// ```dart
/// // ADD THIS IMPORT 
/// import 'package:flutter_localizations/flutter_localizations.dart';
/// 
/// @override
/// Widget build(BuildContext context) {
/// }
/// ```
/// 
/// * If you are in another file do not forget the import (Change according to the path):
/// 
/// ```dart
/// import 'internationalization/Internationalization.dart';
/// ```
/// 
/// * USE JSON FILE (Internationalization)
/// 
///   We assume that our JSON contains the key "hello" like this :
/// 
///   ```json
///   {
///     "_comment": "file en.json",
///     "hello": "Hello"
///   }
///   
///   {
///     "_comment": "file fr.json",
///     "hello": "Hello"
///   }
/// 
///   {
///     "_comment": "file it.json",
///     "hello": "Ciao"
///   }
///   ```
///   
///   In your dart code, use like this :
/// 
/// ```dart
/// // In a string
/// String helloText = Internationalization.of(context).greetTo('hello');
/// // or in the Widget
/// Text(Internationalization.of(context).greetTo('hello'),),
/// ```
/// 
/// ## Screenshots examples
/// 
/// ![Example 1 : English](screenshots/english.png)
/// 
/// ![Example 2 : French](screenshots/french.png)
/// 
/// ## Author
/// 
/// * [Avi Mimoun](https://www.github.com/av1m)
/// 
/// ## Repository available on Github
/// 
/// * [Link of this repository](https://github.com/av1m/JsonInternationalization)
class Internationalization {
  /// All languages ​​recovered from JSON files
  final Map<String, Map<String, String>> localizedValues;

  /// Language in use (instance)
  /// for example fr, en ..
  Locale locale;

  Internationalization(this.locale, this.localizedValues);

  /// Access the current instance to retrieve the correct language
  ///
  /// For this example, we assume that we have this in our JSON file
  /// ```json
  /// {
  ///   "hi": "Salut",
  ///   "helloWorld": "Bonjour le monde !"
  /// }
  /// ```
  /// And with dart we can use like this :
  /// ```dart
  /// import 'internationalization.dart'; // put the right path
  /// Internationalization.of(context).greetTo("HelloWorld");
  /// ```
  static Internationalization of(BuildContext context) {
    return Localizations.of<Internationalization>(
        context, Internationalization);
  }

  /// retrieve the value associated with the key [keyName] in the JSON file for the current language
  greetTo(keyName) => localizedValues[locale.languageCode][keyName];

  /// Change the current language by the [locale] language passed in parameter
  /// If there is no [local] filled in:
  ///   - We change only from fr to en
  changeLanguage(locale) {
    if (locale != null) {
      this.locale = Locale(locale, "");
    }
  }
}

class InternationalizationDelegate
    extends LocalizationsDelegate<Internationalization> {
  /// All languages ​​recovered from JSON files
  final Map<String, Map<String, String>> localizedValues;

  InternationalizationDelegate(this.localizedValues);

  /// Verify if the [local] passed in params is supported by the application
  /// The check is done using [languages]. (variables that contains all supported languages)
  @override
  bool isSupported(Locale locale) => supportedLanguages.contains(locale.languageCode);

  /// Returning a SynchronousFuture here because an async "load" operation
  /// isn't needed to produce an instance of Internationalization.
  @override
  Future<Internationalization> load(Locale locale) {
    return SynchronousFuture<Internationalization>(
        Internationalization(locale, localizedValues));
  }

  @override
  bool shouldReload(InternationalizationDelegate old) => false;
}
