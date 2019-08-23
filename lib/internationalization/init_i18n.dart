import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'Internationalization.dart' show supportedLanguages;

/// Allow to retrieve and load a JSON file from the assets
/// return [String] containing the JSON data of the file [file]
Future<String> loadJsonFromAsset(file) async {
  return await rootBundle.loadString(file);
}

/// Takes as input a [jsonObj] which is in the form [Map <String, dynamic>] and converts it
/// Then, this function returns a [Map <String, String>]
Map<String, String> convertValueToString(jsonObj) {
  Map<String, String> result = {};
  jsonObj.forEach((key, value) {
    result[key] = value.toString(); // convert dynamic to String
  });
  return result;
}

/// Function that retrieves all the language files needed by the application
/// return [Future<Map<String, Map<String, String>>>] :
///   * Future because we have to go get the files, read them and process them
///   * First Map because we have several languages
///   * Second Map contain the language
/// NOTE: We look at the languages ​​contained in the variables [supportedLanguages] and in function, we will look for its language file
Future<Map<String, Map<String, String>>> initializeI18n() async {
  Map<String, Map<String, String>> values = {};
  for (String language in supportedLanguages) {
    // We are going to look for a language file (in JSON format)
    Map<String, dynamic> translation = json.decode(await loadJsonFromAsset(
        'lib/internationalization/i18n/' + language + '.json'));
    // Convert JSON values ​​to String
    // Passing a Map<String, dynamic> to Map<String, String>
    values[language] = convertValueToString(translation);
  }
  return values;
}
