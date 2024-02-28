import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'dailoz/yatogami_page/yatogami_Authentication/yatogami__splashscreen.dart';
import 'dailoz/yatogami_theme/yatogami_theme.dart';
import 'dailoz/yatogami_theme/yatogami_themecontroller.dart';
import 'dailoz/yatogami_translation/stringtranslation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,

  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  final themedata = Get.put(DailozThemecontroler());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: themedata.isdark ? DailozMythemes.darkTheme : DailozMythemes.lightTheme,
      fallbackLocale: const Locale('en', 'US'),
      translations: DailozApptranslation(),
      locale: const Locale('en', 'US'),
      home: const DailozSplashscreen(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('vi', 'VN'), // Tiếng Việt
        const Locale('en', 'US'), // Tiếng Anh
        // Add other locales you need
      ],


    );




  }

}