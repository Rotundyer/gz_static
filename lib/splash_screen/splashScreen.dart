import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gz_static/units/units.dart';

import '../assets/CustomColors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
              CustomColors.black_grey_blue,
              CustomColors.light_blue,
              CustomColors.turquoise
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Container(
              width: getScreenWidth(context) / 2.7,
              height: getScreenWidth(context) * 1.14,
              // height: 100,
              // child: Image.asset('images/logo.png', width: 100.0, height: 100.0,),
              child: const Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: CustomColors.black_50,
                    minimumSize: const Size.fromHeight(70)),
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: Text(AppLocalizations.of(context)!.start,
                style: const TextStyle(
                  fontSize: 20,
                  color: CustomColors.white,
                  fontFamily: 'Nunito'
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
