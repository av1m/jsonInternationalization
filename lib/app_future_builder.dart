import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/first_page.dart';
import 'internationalization/Internationalization.dart';
import 'internationalization/init_i18n.dart';

class AppFutureBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, Map<String, String>>>(
        future: initializeI18n(), // Retrieves JSON language files
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // We check if we have data in snapshot (if snapshot is empty we cannot construct the MaterialApp)
          if (snapshot.hasData) {
            return MaterialApp(
              /// For internationalization
              localizationsDelegates: [
                // here snapshot.data contain the localized values needed for `[Internationalization()]`
                InternationalizationDelegate(snapshot.data),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: supportedLanguages.map((language) => Locale(language, '')),
              home: FirstPage(),
            );
          } 
          return CircularProgressIndicator();
        });
  }
}
