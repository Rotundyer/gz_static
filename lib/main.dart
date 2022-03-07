import 'package:flutter/material.dart';
import 'package:gz_static/splash_screen/splashScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'menu.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() => runApp(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/second': (context) => const MenuApp()
      },
    ));
