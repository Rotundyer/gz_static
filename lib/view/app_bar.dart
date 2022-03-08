
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../assets/CustomColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBar({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context){
    return AppBar(
      toolbarHeight: height,
      centerTitle: true,
      elevation: 1,
      leadingWidth: 55,
      backgroundColor: CustomColors.light_grey,
      shadowColor: CustomColors.black_50,
      title: TextButton(
        child: Text(
          AppLocalizations.of(context)!.exit,
          style: const TextStyle(
            fontSize: 24,
            color: CustomColors.light_purple,
            fontFamily: 'Nunito_extra_bold',
          ),
        ),
        onPressed: () {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
        },
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 25, top: 15, bottom: 15),
        child: IconButton(
          icon: Image.asset('assets/images/arrow_left.png'),
          iconSize: 55,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: IconButton(
            iconSize: 55,
            splashRadius: 1,
            icon: Image.asset('assets/images/logotype.png'),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}