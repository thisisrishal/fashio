import 'package:fashio/configs/sharedPrefs.dart';
import 'package:fashio/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // UserSharedPrefs.init();

  runApp(
    const MyApp(),
  );
}
