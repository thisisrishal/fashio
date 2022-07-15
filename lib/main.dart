import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/Hive/fav_model.dart';
import 'view/app.dart';


late Box<FavModel> favBox;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Hive.initFlutter();


  Hive.registerAdapter(FavModelAdapter());
   favBox = await Hive.openBox<FavModel>('favBox');


  runApp(
    const MyApp(),
  );
}

