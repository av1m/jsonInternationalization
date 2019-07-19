import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'internationalization/Internationalization.dart';
import 'screens/first_page.dart';

class App extends StatelessWidget {
  // For internationalization
  final Map<String, Map<String, String>> localizedValues;

  App(this.localizedValues);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        InternationalizationDelegate(this.localizedValues),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: supportedLanguages.map(
        (language) => Locale(language, '')
      ),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: FirstPage(),
    );
  }
}
