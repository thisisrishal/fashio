import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // UserSharedPrefs.init();

  runApp(
    const MyApp(),
  );
}

