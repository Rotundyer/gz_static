import 'package:flutter/material.dart';
import 'package:gz_static/view/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gz_static/view/light_button.dart';

import '../assets/CustomColors.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.light_grey,
        appBar: const CustomAppBar(height: 100),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LightButton(
              routeName: "sunsets",
              text: AppLocalizations.of(context)!.sunsets,
            ),
            LightButton(
              routeName: "statistics",
              text: AppLocalizations.of(context)!.statistics,
            )
          ],
        ));
  }
}
