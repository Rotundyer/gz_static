import 'package:flutter/material.dart';
import 'package:gz_static/view/personalSunset.dart';
import 'package:gz_static/view/splashScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gz_static/view/statistics.dart';
import 'package:gz_static/view/sunsets.dart';
import 'view/menu.dart';

void main() => runApp(MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        'menu': (context) => const Menu(),
        'sunsets': (context) => const Sunsets(),
        'personal sunset': (context) => const PersonalSunset(),
        'statistics': (context) => const Statistics(),
      },
    ));
