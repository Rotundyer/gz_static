import 'package:flutter/material.dart';
import 'package:gz_static/view/widgets/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gz_static/view/widgets/light_button.dart';

import '../assets/CustomColors.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

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