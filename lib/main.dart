import 'package:flutter/material.dart';

// First use case
import 'app.dart';
import 'internationalization/init_i18n.dart';

// Second use case (FutureBuilder)
import 'app_future_builder.dart';

// First use case
void mainn() async {
  Map<String, Map<String, String>> localizedValues = await initializeI18n();
  runApp(App(localizedValues));
}

// Second use case (FutureBuilder)
void main() {
  runApp(AppFutureBuilder());
}
