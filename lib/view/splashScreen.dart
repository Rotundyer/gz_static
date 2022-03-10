import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gz_static/units/units.dart';

import '../assets/CustomColors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [
                  0.1,
                  0.3,
                  1
                ],
                colors: [
                  CustomColors.dark_purple,
                  CustomColors.light_purple,
                  CustomColors.turquoise
                ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Container(
                width: getScreenWidth(context) / 2.7,
                height: getScreenWidth(context) * 1.14,
                child: Image.asset('assets/images/logo.png')),
            Container(
              margin: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: CustomColors.black_50,
                    minimumSize: const Size.fromHeight(70)),
                onPressed: () => Navigator.pushNamed(context, 'menu'),
                child: Text(
                  AppLocalizations.of(context)!.start,
                  style: const TextStyle(
                      fontSize: 20,
                      color: CustomColors.white,
                      fontFamily: 'Nurito'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}