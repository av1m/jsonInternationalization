import 'package:flutter/material.dart';

import 'app.dart';
import 'internationalization/init_i18n.dart';

void main() async {
  Map<String, Map<String, String>> localizedValues = await initializeI18n();
  runApp(App(localizedValues));
}
